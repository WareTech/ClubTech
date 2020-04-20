# ClubTech
ClubTech

PROYECTO INTEGRAL ADIP 

OBJETIVO

Sistematizar procesos de gestión, administrativos, deportivos y de salud por medio de una herramienta informática sencilla y agil

MODULO 1: INICIAL FICHA DE SOCIO/DEPORTISTA

    datos filiatorios 
    solapa general :
    apellido, nombre
    DNI (N° SOCIO)
    direccion, telefono de contacto, mail (permitir cargar mas de una opción por ítem)
    fecha de nacimiento
    nombre apellido de los padres
    
    Solapa financiera
    medio de pago: 
    cobrador,
    debito en cuenta (posibilidad de incorporar campos) 
    debito automático (tarjeta de credito?)
    Beca: 
    si [motivo, monto, porcentaje]
    no
    historial (años anteriores)
    solapa deportiva:
    Actividad: [desplega opciones] 
    sin actividad solo socio
    futbol
    zumba
    gimnasia
    posibilidad de incluir otras actividades a desarrollar a futuro
    Para Futbol: puesto que juega, pierna habil, categoria, competencia
    Se podria agregar:
    Comportamiento/Conducta
    Evaluación general/anual del DT y/o Coordinadores
    solapa medica:
    estudios realizados, patologias, lesiones, seguimientos
    posibilidad de adjuntar informes de estudios medicos
    Obra social (nombre/n° socio/contacto emergencias/derivaciones)
    solapa otros:
    actividades/cargos/comisiones que integra

MODULO 2: CAJA
SUB MODULO 1:

FACTURACION Y COBRANZAS:
Facturación:
establecer valor de cuota
base (valor solo socio?)
por actividad [se adiciona]
generacion de facturación mensual por socio
enviar mensaje con la facturación (por mail u otra vía de comunicación?)


Cobranzas:

registro de pagos por los distintos medios
generación de recibos de pago en el acto de cobranza (Recibos “X”)
generación de ajustes de cobranza
seguimiento de cta cte de un socio

SUB MODULO 2

Registro de movimientos de jornadas deportivas [ver base de desarrollo planilla de jornada] (???)

SUB MODULO 3

Buffet
movimiento de caja
stock
Store?

SUB MODULO 4

Caja central
movimientos generales de gastos
movimientos generales de ingresos

MODULO 3: REPORTES E INFORMES

Reportes de facturacion y cobranzas
estado de deuda por socio
reporte de estado de deudores por socio por categoria ($ / % / antigüedad deuda)
rendicion de caja
reporte de ingresos
reporte de egresos

------------------------------------------------------------------------------------------------------------------------
mysql -uroot -proot
use WareTech_ClubTech;
