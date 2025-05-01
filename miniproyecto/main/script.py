import os
import time
import random
import threading
import logging
from datetime import datetime
from sqlalchemy import create_engine, Column, Integer, String, DECIMAL, ForeignKey, TIMESTAMP
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import sys

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
)

DB_HOST = os.getenv("DB_HOST", "localhost")
DB_NAME = os.getenv("DB_NAME", "banco")
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "postgres")

DATABASE_URL = f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}"
engine = create_engine(DATABASE_URL)
Base = declarative_base()
Session = sessionmaker(bind=engine)

class Cuenta(Base):
    __tablename__ = "cuentas"
    id_cuenta = Column(Integer, primary_key=True)
    nombre_cliente = Column(String)
    saldo = Column(DECIMAL)

class Transaccion(Base):
    __tablename__ = "transacciones"
    id_transaccion = Column(Integer, primary_key=True)
    id_cuenta = Column(Integer, ForeignKey("cuentas.id_cuenta"))
    tipo_transaccion = Column(String)
    monto = Column(DECIMAL)
    fecha_transaccion = Column(TIMESTAMP)

def generar_datos(tiempo_ejecucion):
    inicio = time.time()
    session = Session()
    logging.info("Iniciando simulación...")

    while time.time() - inicio < tiempo_ejecucion:
        try:
            nombre_cliente = f"Cliente {random.randint(1, 1000)}"
            saldo = round(random.uniform(1000, 10000), 2)
            cuenta = Cuenta(nombre_cliente=nombre_cliente, saldo=saldo)
            session.add(cuenta)
            session.flush()

            tipo = random.choice(["deposito", "retiro"])
            monto = round(random.uniform(100, 1000), 2)
            transaccion = Transaccion(
                id_cuenta=cuenta.id_cuenta,
                tipo_transaccion=tipo,
                monto=monto,
                fecha_transaccion=datetime.now()
            )
            session.add(transaccion)
            session.commit()
            logging.info(f"Insertado: Cuenta {cuenta.id_cuenta}, {tipo} de {monto}")
            time.sleep(2)

        except Exception as e:
            logging.error(f"Error: {e}")
            session.rollback()

    session.close()
    logging.info("Simulación finalizada.")

if __name__ == "__main__":
    try:
        tiempo = int(sys.argv[1]) if len(sys.argv) > 1 else 60
        hilo = threading.Thread(target=generar_datos, args=(tiempo,))
        hilo.start()
        hilo.join()
    except Exception as e:
        logging.error(f"Error en el programa principal: {e}")
