use [EJERCICIO_2]
go
--Proveedor
INSERT INTO [dbo].[Proveedor] ([NomProv], [Categoria], [CiudadProv])
		VALUES ('Prov1','Cat1', 'San Justo')
INSERT INTO [dbo].[Proveedor] ([NomProv], [Categoria], [CiudadProv]) VALUES ('Prov2','Cat2', 'San justo')
INSERT INTO [dbo].[Proveedor] ([NomProv], [Categoria], [CiudadProv]) VALUES ('Prov3','Cat3', 'Laferrere')
INSERT INTO [dbo].[Proveedor] ([NomProv], [Categoria], [CiudadProv]) VALUES ('Prov4','Cat4', 'Isidro Casanova')
INSERT INTO [dbo].[Proveedor] ([NomProv], [Categoria], [CiudadProv]) VALUES ('Prov5','Cat5', 'Gonzalez Catan')
INSERT INTO [dbo].[Proveedor] ([NomProv], [Categoria], [CiudadProv]) VALUES ('Prov6','Cat6', 'Ramos Mejia')

--

--[dbo].[Articulo]
INSERT INTO [dbo].[Articulo] ([Descripcion], [CiudadArt], [Precio]) VALUES ('Art1','San Justo', 50.20) 
INSERT INTO [dbo].[Articulo] ([Descripcion], [CiudadArt], [Precio]) VALUES ('Art2','Laferrere', 5000.520)
INSERT INTO [dbo].[Articulo] ([Descripcion], [CiudadArt], [Precio]) VALUES ('Art3','Gonzalez Catan', 80010)
INSERT INTO [dbo].[Articulo] ([Descripcion], [CiudadArt], [Precio]) VALUES ('Art4','Ramos Mejia', 74120)
INSERT INTO [dbo].[Articulo] ([Descripcion], [CiudadArt], [Precio]) VALUES ('Art5','Ramos Mejia', 602.30)
INSERT INTO [dbo].[Articulo] ([Descripcion], [CiudadArt], [Precio]) VALUES ('Art6','Ramos Mejia', 9.201)
INSERT INTO [dbo].[Articulo] ([Descripcion], [CiudadArt], [Precio]) VALUES ('Art7','Laferrere', 85440.2440)

--Cliente

INSERT INTO [dbo].[Cliente] ([NomCli], [CiudadCli]) VALUES ('Cli1','Laferrere')
INSERT INTO [dbo].[Cliente] ([NomCli], [CiudadCli]) VALUES ('Cli2','Laferrere')
INSERT INTO [dbo].[Cliente] ([NomCli], [CiudadCli]) VALUES ('Cli3','San Justo')
INSERT INTO [dbo].[Cliente] ([NomCli], [CiudadCli]) VALUES ('Cli4','Ramos Mejia')
INSERT INTO [dbo].[Cliente] ([NomCli], [CiudadCli]) VALUES ('Cli5','Gonzalez Catan')
INSERT INTO [dbo].[Cliente] ([NomCli], [CiudadCli]) VALUES ('Cli6','San Justo')
INSERT INTO [dbo].[Cliente] ([NomCli], [CiudadCli]) VALUES ('Cli7','Ramos Mejia')

--Pedido

INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (1,1,1,GETDATE(),5,209000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (1,1,2,GETDATE(),99,29000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (1,1,3,GETDATE(),524,9000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (1,2,1,GETDATE(),55,29000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (1,3,1,GETDATE(),966,4000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (1,4,2,GETDATE(),447,444000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (2,1,1,GETDATE(),254,2800)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (2,2,1,GETDATE(),9968,39000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (2,1,2,GETDATE(),249,449000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (3,1,1,GETDATE(),887,49000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (3,4,1,GETDATE(),998,200)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (2,4,1,GETDATE(),754,9000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (3,3,4,GETDATE(),1320,400)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (4,1,1,GETDATE(),8,24000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (4,2,1,GETDATE(),7769,19000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (4,3,1,GETDATE(),785,5000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (4,3,2,GETDATE(),998,19000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (5,1,1,GETDATE(),587,88000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (5,1,4,GETDATE(),999,9000)
INSERT INTO [dbo].[Pedido] ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal]) VALUES (5,5,5,GETDATE(),20,9000)


--[Stock]

INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (1, '20200101',1254)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (1, '20200201',300)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (1, '20200301',8800)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (2, '20200101',6700)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (2, '20200201',9700)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (2, '20200301',7800)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (3, '20190101',9870)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (3, '20200101',25400)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (3, '20180101',9900)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (4, '20200101',870)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (4, '20190101',55600)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (4, '20180101',9900)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (5, '20200101',166000)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (5, '20200102',64450)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (5, '20200103',54660)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (5, '20200104',70)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (6, '20200101',100)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (6, '20200202',5500)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (6, '20200303',700)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (6, '20200304',1700)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (7, '20200101',500)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (7, '20200303',44000)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (7, '20200304',400)

INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (1, '20150101',140)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (2, '20160101',104)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (3, '20170101',140)
INSERT INTO [dbo].[Stock]([NroArt], [fecha], [cantidad]) VALUES (4, '20180106',10300)

