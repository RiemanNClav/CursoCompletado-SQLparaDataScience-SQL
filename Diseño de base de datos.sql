-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-06-29 20:29:25.103

-- tables
-- Table: Almacen
CREATE TABLE Almacen (
    C_Almacen int  NOT NULL,
    D_Distrito varchar(100)  NOT NULL,
    N_Telefono int  NOT NULL,
    D_Direccion varchar(500)  NOT NULL,
    Sucursal_C_Sucursal int  NOT NULL,
    CONSTRAINT Almacen_pk PRIMARY KEY  (C_Almacen)
);

-- Table: Cargo
CREATE TABLE Cargo (
    C_Cargo int  NOT NULL,
    D_Cargo varchar(100)  NOT NULL,
    T_Descripcion text  NOT NULL,
    M_Salario money  NOT NULL,
    CONSTRAINT Cargo_pk PRIMARY KEY  (C_Cargo)
);

-- Table: CargoxPersonal
CREATE TABLE CargoxPersonal (
    Personal_C_Personal int  NOT NULL,
    Cargo_C_Cargo int  NOT NULL,
    H_HorasEntrada time  NOT NULL,
    H_HoraSalida int  NOT NULL
);

-- Table: Categoria
CREATE TABLE Categoria (
    C_Categoria int  NOT NULL,
    D_Nombre varchar(100)  NOT NULL,
    T_Descripcion varchar(500)  NOT NULL,
    T_URLImagen image  NOT NULL,
    CONSTRAINT Categoria_pk PRIMARY KEY  (C_Categoria)
);

-- Table: Cliente
CREATE TABLE Cliente (
    C_Cliente int  NOT NULL,
    D_Nombre varchar(100)  NOT NULL,
    N_DNI int  NOT NULL,
    T_Correo varchar(300)  NULL,
    B_Registrado bit  NOT NULL,
    N_Celular int  NOT NULL,
    F_FechaNacimiento date  NOT NULL,
    D_Tipo_de_cliente varchar(100)  NOT NULL,
    D_Ruc varchar(100)  NULL,
    CONSTRAINT Cliente_pk PRIMARY KEY  (C_Cliente)
);

-- Table: ClienteAfiliado
CREATE TABLE ClienteAfiliado (
    C_Cliente_afiliado int  NOT NULL,
    T_Beneficios text  NOT NULL,
    D_Nombre varchar(100)  NOT NULL,
    M_Pago money  NOT NULL,
    F_Membresia date  NOT NULL,
    Sucursal_C_Sucursal int  NOT NULL,
    CONSTRAINT ClienteAfiliado_pk PRIMARY KEY  (C_Cliente_afiliado)
);

-- Table: ComprobanteDePago
CREATE TABLE ComprobanteDePago (
    C_Comprobante int  NOT NULL,
    F_Fecha date  NOT NULL,
    H_Hora time  NOT NULL,
    Promocion_C_Promocion int  NOT NULL,
    Cliente_C_Cliente int  NOT NULL,
    MetodoDePago_C_MetodoDePago int  NOT NULL,
    CONSTRAINT ComprobanteDePago_pk PRIMARY KEY  (C_Comprobante)
);

-- Table: DetalleVenta
CREATE TABLE DetalleVenta (
    Q_CantidadProducto int  NOT NULL,
    M_PrecioXQ decimal(3,2)  NOT NULL,
    C_DetalleVenta int  NOT NULL,
    Personal_C_Personal int  NOT NULL,
    Sucursal_C_Sucursal int  NOT NULL,
    Producto_C_Producto int  NOT NULL,
    ComprobanteDePago_C_Comprobante int  NOT NULL,
    Repartidor_C_Repartidor int  NOT NULL,
    RunPoints_C_Puntos int  NOT NULL,
    CONSTRAINT DetalleVenta_pk PRIMARY KEY  (C_DetalleVenta)
);

-- Table: Efectivo
CREATE TABLE Efectivo (
    C_Efectivo int  NOT NULL,
    M_Pago float  NOT NULL,
    CONSTRAINT Efectivo_pk PRIMARY KEY  (C_Efectivo)
);

-- Table: EmpleadoDelMes
CREATE TABLE EmpleadoDelMes (
    C_Empleado int  NOT NULL,
    M_Aumento money  NOT NULL,
    Personal_C_Personal int  NOT NULL,
    Cargo_C_Cargo int  NOT NULL,
    Sucursal_C_Sucursal int  NOT NULL,
    CONSTRAINT EmpleadoDelMes_pk PRIMARY KEY  (C_Empleado)
);

-- Table: EmpresaDeEnvios
CREATE TABLE EmpresaDeEnvios (
    C_EmpresaDeEnvios int  NOT NULL,
    D_Nombre varchar(200)  NOT NULL,
    N_RUC int  NOT NULL,
    CONSTRAINT EmpresaDeEnvios_pk PRIMARY KEY  (C_EmpresaDeEnvios)
);

-- Table: Envio
CREATE TABLE Envio (
    C_Envio int  NOT NULL,
    F_Fecha date  NOT NULL,
    D_Descripcion int  NOT NULL,
    Cliente_C_Cliente int  NOT NULL,
    EmpresaDeEnvios_C_Empresa int  NOT NULL,
    H_Hora time  NOT NULL,
    Producto_C_Producto int  NOT NULL,
    CONSTRAINT Envio_pk PRIMARY KEY  (C_Envio)
);

-- Table: MetodoDePago
CREATE TABLE MetodoDePago (
    C_MetodoDePago int  NOT NULL,
    D_MetodoDePago varchar(200)  NOT NULL,
    Efectivo_C_Efectivo int  NOT NULL,
    Tarjeta_C_Tarjeta int  NOT NULL,
    CONSTRAINT MetodoDePago_pk PRIMARY KEY  (C_MetodoDePago)
);

-- Table: Personal
CREATE TABLE Personal (
    C_Personal int  NOT NULL,
    D_Nombre varchar(200)  NOT NULL,
    N_DNI int  NOT NULL,
    B_EnEvaluacion bit  NOT NULL,
    F_FechaIngreso date  NOT NULL,
    B_Almacen bit  NOT NULL,
    Sucursal_C_Sucursal int  NOT NULL,
    B_Sucursal bit  NOT NULL,
    Almacen_C_Almacen int  NOT NULL,
    CONSTRAINT Personal_pk PRIMARY KEY  (C_Personal)
);

-- Table: Producto
CREATE TABLE Producto (
    C_Producto int  NOT NULL,
    D_Nombre varchar(100)  NOT NULL,
    T_URLImagen image  NOT NULL,
    T_Descripcion varchar(300)  NOT NULL,
    Categoria_C_Categoria int  NOT NULL,
    CONSTRAINT Producto_pk PRIMARY KEY  (C_Producto)
);

-- Table: ProductoXProveedor
CREATE TABLE ProductoXProveedor (
    Proveedor_C_Proveedor int  NOT NULL,
    Producto_C_Producto int  NOT NULL,
    M_Precioxunidad money  NOT NULL,
    Q_Cantidad int  NOT NULL
);

-- Table: ProductoXSucursal
CREATE TABLE ProductoXSucursal (
    Z_Abastecimiento datetime  NOT NULL,
    Q_Stock int  NOT NULL,
    Sucursal_C_Sucursal int  NOT NULL,
    Producto_C_Producto int  NOT NULL
);

-- Table: ProductoXValeDeDescuento
CREATE TABLE ProductoXValeDeDescuento (
    Producto_C_Producto int  NOT NULL,
    ValeDeDescuento_C_Vale_de_descuento int  NOT NULL
);

-- Table: Promocion
CREATE TABLE Promocion (
    C_Promocion int  NOT NULL,
    Q_Cantidad int  NOT NULL,
    M_Precio int  NOT NULL,
    Z_FechaValidez date  NOT NULL,
    CONSTRAINT Promocion_pk PRIMARY KEY  (C_Promocion)
);

-- Table: PromocionXProducto
CREATE TABLE PromocionXProducto (
    Producto_C_Producto int  NOT NULL,
    Promocion_C_Promocion int  NOT NULL
);

-- Table: Proveedor
CREATE TABLE Proveedor (
    C_Proveedor int  NOT NULL,
    D_Nombre varchar(100)  NOT NULL,
    N_Telefono int  NOT NULL,
    D_Ciudad varchar(100)  NOT NULL,
    N_RUC int  NOT NULL,
    T_Direccion varchar(500)  NOT NULL,
    CONSTRAINT Proveedor_pk PRIMARY KEY  (C_Proveedor)
);

-- Table: Reclamo
CREATE TABLE Reclamo (
    C_Reclamo int  NOT NULL,
    D_Descripcion text  NOT NULL,
    Cliente_C_Cliente int  NOT NULL,
    F_Fecha date  NOT NULL,
    H_Hora time  NOT NULL,
    CONSTRAINT Reclamo_pk PRIMARY KEY  (C_Reclamo)
);

-- Table: Repartidor
CREATE TABLE Repartidor (
    C_Repartidor int  NOT NULL,
    Vehiculo_C_Vehiculo int  NOT NULL,
    D_Nombre varchar(200)  NOT NULL,
    N_DNI int  NOT NULL,
    D_Apellidos varchar(200)  NOT NULL,
    CONSTRAINT Repartidor_pk PRIMARY KEY  (C_Repartidor)
);

-- Table: RunPoints
CREATE TABLE RunPoints (
    C_Puntos int  NOT NULL,
    N_Cantidad int  NOT NULL,
    Cliente_C_Cliente int  NOT NULL,
    CONSTRAINT RunPoints_pk PRIMARY KEY  (C_Puntos)
);

-- Table: Ruta
CREATE TABLE Ruta (
    C_Ruta int  NOT NULL,
    T_Ubicacion text  NOT NULL,
    H_HoraEstimada time  NOT NULL,
    Repartidor_C_Repartidor int  NOT NULL,
    CONSTRAINT Ruta_pk PRIMARY KEY  (C_Ruta)
);

-- Table: StatusReclamo
CREATE TABLE StatusReclamo (
    C_Status_Reclamo int  NOT NULL,
    D_Status text  NOT NULL,
    F_Fecha date  NOT NULL,
    Reclamo_C_Reclamo int  NOT NULL,
    CONSTRAINT StatusReclamo_pk PRIMARY KEY  (C_Status_Reclamo)
);

-- Table: Sucursal
CREATE TABLE Sucursal (
    C_Sucursal int  NOT NULL,
    D_Direccion varchar(300)  NOT NULL,
    D_NombreEncargado varchar(300)  NOT NULL,
    N_DNIEncargado int  NOT NULL,
    N_TelefonoEncargado int  NOT NULL,
    D_Distrito varchar(100)  NOT NULL,
    CONSTRAINT Sucursal_pk PRIMARY KEY  (C_Sucursal)
);

-- Table: Tarjeta
CREATE TABLE Tarjeta (
    C_Tarjeta int  NOT NULL,
    N_Numero_de_tarjeta int  NOT NULL,
    D_TipoTarjeta varchar(100)  NOT NULL,
    Cliente_C_Cliente int  NOT NULL,
    CONSTRAINT Tarjeta_pk PRIMARY KEY  (C_Tarjeta)
);

-- Table: ValeDeDescuento
CREATE TABLE ValeDeDescuento (
    C_Vale_de_descuento int  NOT NULL,
    Q_Cantidad_de_descuento int  NOT NULL,
    Z_FechaValidez date  NOT NULL,
    CONSTRAINT ValeDeDescuento_pk PRIMARY KEY  (C_Vale_de_descuento)
);

-- Table: Vehiculo
CREATE TABLE Vehiculo (
    C_Vehiculo int  NOT NULL,
    D_Placa varchar(100)  NOT NULL,
    D_Tipo_de_vehiculo varchar(100)  NOT NULL,
    D_Modelo varchar(100)  NOT NULL,
    CONSTRAINT Vehiculo_pk PRIMARY KEY  (C_Vehiculo)
);

-- foreign keys
-- Reference: Almacen_Sucursal (table: Almacen)
ALTER TABLE Almacen ADD CONSTRAINT Almacen_Sucursal
    FOREIGN KEY (Sucursal_C_Sucursal)
    REFERENCES Sucursal (C_Sucursal);

-- Reference: CargoxPersonal_Cargo (table: CargoxPersonal)
ALTER TABLE CargoxPersonal ADD CONSTRAINT CargoxPersonal_Cargo
    FOREIGN KEY (Cargo_C_Cargo)
    REFERENCES Cargo (C_Cargo);

-- Reference: CargoxPersonal_Personal (table: CargoxPersonal)
ALTER TABLE CargoxPersonal ADD CONSTRAINT CargoxPersonal_Personal
    FOREIGN KEY (Personal_C_Personal)
    REFERENCES Personal (C_Personal);

-- Reference: ClienteAfiliado_Sucursal (table: ClienteAfiliado)
ALTER TABLE ClienteAfiliado ADD CONSTRAINT ClienteAfiliado_Sucursal
    FOREIGN KEY (Sucursal_C_Sucursal)
    REFERENCES Sucursal (C_Sucursal);

-- Reference: ComprobanteDePago_Cliente (table: ComprobanteDePago)
ALTER TABLE ComprobanteDePago ADD CONSTRAINT ComprobanteDePago_Cliente
    FOREIGN KEY (Cliente_C_Cliente)
    REFERENCES Cliente (C_Cliente);

-- Reference: ComprobanteDePago_MetodoDePago (table: ComprobanteDePago)
ALTER TABLE ComprobanteDePago ADD CONSTRAINT ComprobanteDePago_MetodoDePago
    FOREIGN KEY (MetodoDePago_C_MetodoDePago)
    REFERENCES MetodoDePago (C_MetodoDePago);

-- Reference: ComprobanteDePago_Promocion (table: ComprobanteDePago)
ALTER TABLE ComprobanteDePago ADD CONSTRAINT ComprobanteDePago_Promocion
    FOREIGN KEY (Promocion_C_Promocion)
    REFERENCES Promocion (C_Promocion);

-- Reference: DetalleVenta_ComprobanteDePago (table: DetalleVenta)
ALTER TABLE DetalleVenta ADD CONSTRAINT DetalleVenta_ComprobanteDePago
    FOREIGN KEY (ComprobanteDePago_C_Comprobante)
    REFERENCES ComprobanteDePago (C_Comprobante);

-- Reference: DetalleVenta_Personal (table: DetalleVenta)
ALTER TABLE DetalleVenta ADD CONSTRAINT DetalleVenta_Personal
    FOREIGN KEY (Personal_C_Personal)
    REFERENCES Personal (C_Personal);

-- Reference: DetalleVenta_Producto (table: DetalleVenta)
ALTER TABLE DetalleVenta ADD CONSTRAINT DetalleVenta_Producto
    FOREIGN KEY (Producto_C_Producto)
    REFERENCES Producto (C_Producto);

-- Reference: DetalleVenta_Repartidor (table: DetalleVenta)
ALTER TABLE DetalleVenta ADD CONSTRAINT DetalleVenta_Repartidor
    FOREIGN KEY (Repartidor_C_Repartidor)
    REFERENCES Repartidor (C_Repartidor);

-- Reference: DetalleVenta_RunPoints (table: DetalleVenta)
ALTER TABLE DetalleVenta ADD CONSTRAINT DetalleVenta_RunPoints
    FOREIGN KEY (RunPoints_C_Puntos)
    REFERENCES RunPoints (C_Puntos);

-- Reference: DetalleVenta_Sucursal (table: DetalleVenta)
ALTER TABLE DetalleVenta ADD CONSTRAINT DetalleVenta_Sucursal
    FOREIGN KEY (Sucursal_C_Sucursal)
    REFERENCES Sucursal (C_Sucursal);

-- Reference: Empleado_del_mes_Cargo (table: EmpleadoDelMes)
ALTER TABLE EmpleadoDelMes ADD CONSTRAINT Empleado_del_mes_Cargo
    FOREIGN KEY (Cargo_C_Cargo)
    REFERENCES Cargo (C_Cargo);

-- Reference: Empleado_del_mes_Personal (table: EmpleadoDelMes)
ALTER TABLE EmpleadoDelMes ADD CONSTRAINT Empleado_del_mes_Personal
    FOREIGN KEY (Personal_C_Personal)
    REFERENCES Personal (C_Personal);

-- Reference: Empleado_del_mes_Sucursal (table: EmpleadoDelMes)
ALTER TABLE EmpleadoDelMes ADD CONSTRAINT Empleado_del_mes_Sucursal
    FOREIGN KEY (Sucursal_C_Sucursal)
    REFERENCES Sucursal (C_Sucursal);

-- Reference: Envio_EmpresaDeEnvios (table: Envio)
ALTER TABLE Envio ADD CONSTRAINT Envio_EmpresaDeEnvios
    FOREIGN KEY (EmpresaDeEnvios_C_Empresa)
    REFERENCES EmpresaDeEnvios (C_EmpresaDeEnvios);

-- Reference: Envio_Producto (table: Envio)
ALTER TABLE Envio ADD CONSTRAINT Envio_Producto
    FOREIGN KEY (Producto_C_Producto)
    REFERENCES Producto (C_Producto);

-- Reference: Envios_Cliente (table: Envio)
ALTER TABLE Envio ADD CONSTRAINT Envios_Cliente
    FOREIGN KEY (Cliente_C_Cliente)
    REFERENCES Cliente (C_Cliente);

-- Reference: MetodoDePago_Efectivo (table: MetodoDePago)
ALTER TABLE MetodoDePago ADD CONSTRAINT MetodoDePago_Efectivo
    FOREIGN KEY (Efectivo_C_Efectivo)
    REFERENCES Efectivo (C_Efectivo);

-- Reference: MetodoDePago_Tarjeta (table: MetodoDePago)
ALTER TABLE MetodoDePago ADD CONSTRAINT MetodoDePago_Tarjeta
    FOREIGN KEY (Tarjeta_C_Tarjeta)
    REFERENCES Tarjeta (C_Tarjeta);

-- Reference: Personal_Almacen (table: Personal)
ALTER TABLE Personal ADD CONSTRAINT Personal_Almacen
    FOREIGN KEY (Almacen_C_Almacen)
    REFERENCES Almacen (C_Almacen);

-- Reference: Personal_Sucursal (table: Personal)
ALTER TABLE Personal ADD CONSTRAINT Personal_Sucursal
    FOREIGN KEY (Sucursal_C_Sucursal)
    REFERENCES Sucursal (C_Sucursal);

-- Reference: ProductoXProveedor_Producto (table: ProductoXProveedor)
ALTER TABLE ProductoXProveedor ADD CONSTRAINT ProductoXProveedor_Producto
    FOREIGN KEY (Producto_C_Producto)
    REFERENCES Producto (C_Producto);

-- Reference: ProductoXProveedor_Proveedor (table: ProductoXProveedor)
ALTER TABLE ProductoXProveedor ADD CONSTRAINT ProductoXProveedor_Proveedor
    FOREIGN KEY (Proveedor_C_Proveedor)
    REFERENCES Proveedor (C_Proveedor);

-- Reference: ProductoXSucursal_Producto (table: ProductoXSucursal)
ALTER TABLE ProductoXSucursal ADD CONSTRAINT ProductoXSucursal_Producto
    FOREIGN KEY (Producto_C_Producto)
    REFERENCES Producto (C_Producto);

-- Reference: ProductoXSucursal_Sucursal (table: ProductoXSucursal)
ALTER TABLE ProductoXSucursal ADD CONSTRAINT ProductoXSucursal_Sucursal
    FOREIGN KEY (Sucursal_C_Sucursal)
    REFERENCES Sucursal (C_Sucursal);

-- Reference: ProductoXValeDeDescuento_Producto (table: ProductoXValeDeDescuento)
ALTER TABLE ProductoXValeDeDescuento ADD CONSTRAINT ProductoXValeDeDescuento_Producto
    FOREIGN KEY (Producto_C_Producto)
    REFERENCES Producto (C_Producto);

-- Reference: ProductoXValeDeDescuento_ValeDeDescuento (table: ProductoXValeDeDescuento)
ALTER TABLE ProductoXValeDeDescuento ADD CONSTRAINT ProductoXValeDeDescuento_ValeDeDescuento
    FOREIGN KEY (ValeDeDescuento_C_Vale_de_descuento)
    REFERENCES ValeDeDescuento (C_Vale_de_descuento);

-- Reference: Producto_Categoria (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT Producto_Categoria
    FOREIGN KEY (Categoria_C_Categoria)
    REFERENCES Categoria (C_Categoria);

-- Reference: PromocionXProducto_Producto (table: PromocionXProducto)
ALTER TABLE PromocionXProducto ADD CONSTRAINT PromocionXProducto_Producto
    FOREIGN KEY (Producto_C_Producto)
    REFERENCES Producto (C_Producto);

-- Reference: PromocionXProducto_Promocion (table: PromocionXProducto)
ALTER TABLE PromocionXProducto ADD CONSTRAINT PromocionXProducto_Promocion
    FOREIGN KEY (Promocion_C_Promocion)
    REFERENCES Promocion (C_Promocion);

-- Reference: Puntos_Cliente (table: RunPoints)
ALTER TABLE RunPoints ADD CONSTRAINT Puntos_Cliente
    FOREIGN KEY (Cliente_C_Cliente)
    REFERENCES Cliente (C_Cliente);

-- Reference: Reclamo_Cliente (table: Reclamo)
ALTER TABLE Reclamo ADD CONSTRAINT Reclamo_Cliente
    FOREIGN KEY (Cliente_C_Cliente)
    REFERENCES Cliente (C_Cliente);

-- Reference: Repartidor_Vehiculo (table: Repartidor)
ALTER TABLE Repartidor ADD CONSTRAINT Repartidor_Vehiculo
    FOREIGN KEY (Vehiculo_C_Vehiculo)
    REFERENCES Vehiculo (C_Vehiculo);

-- Reference: Ruta_Repartidor (table: Ruta)
ALTER TABLE Ruta ADD CONSTRAINT Ruta_Repartidor
    FOREIGN KEY (Repartidor_C_Repartidor)
    REFERENCES Repartidor (C_Repartidor);

-- Reference: StatusReclamo_Reclamo (table: StatusReclamo)
ALTER TABLE StatusReclamo ADD CONSTRAINT StatusReclamo_Reclamo
    FOREIGN KEY (Reclamo_C_Reclamo)
    REFERENCES Reclamo (C_Reclamo);

-- Reference: Tarjeta_Cliente (table: Tarjeta)
ALTER TABLE Tarjeta ADD CONSTRAINT Tarjeta_Cliente
    FOREIGN KEY (Cliente_C_Cliente)
    REFERENCES Cliente (C_Cliente);

-- End of file.

