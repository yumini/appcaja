# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
moneda = Moneda.create([
						{ nom_moneda: 'Nuevos Soles', simb_moneda: 'S/.', abrev_moneda: 'PEN'  }, 
						{ nom_moneda: 'Dolares Americanos', simb_moneda: '$.', abrev_moneda: 'US'  }
					  ])
cliente = Cliente.create([{ nombre: 'Yumi', apepat: 'Tominaga', apemat: 'Garcia', tipdoc: 'DNI', numdoc: '41792179', direccion: 'Fonavi T-9-Yarina Cocha', fecnac: DateTime.parse("30/03/1983 17:00"),tfno: '573655', celular: '961659126'   }, 
						  {nombre: 'Rocio del Pilar', apepat: 'Alvan', apemat: 'Perez', tipdoc: 'DNI', numdoc: '40953578', direccion: 'Jr. Augusto B. Leguia 746', fecnac: DateTime.parse("06/03/1981 17:00"), tfno: '574843', celular: '964688956'},
						  {nombre: 'Jorge Eduardo', apepat: 'Trigueros', apemat: 'Bellido', tipdoc: 'DNI', numdoc: '40223523', direccion: 'Fonavi T-3-Yarina Cocha', fecnac: DateTime.parse("11/08/1981 17:00"), tfno: '578122', celular: '968565632'}
						 ])
tipoopera=TipOperacion.create ([
							{nom_opera: 'Depósito cuenta corriente', abrev_opera: 'DCTE', tipo_opera: 'Ingreso', contable:'Si'},
							{nom_opera: 'Retiro cuenta corriente', abrev_opera: 'RCTE', tipo_opera: 'Salida', contable:'Si'},
							{nom_opera: 'Depósito en tarjeta de credito', abrev_opera: 'DTCR', tipo_opera: 'Ingreso', contable:'Si'},
							{nom_opera: 'Retiro en tarjeta de credito', abrev_opera: 'RCTE', tipo_opera: 'Salida', contable:'Si'},
							{nom_opera: 'Liquidacion de letras', abrev_opera: 'LILE', tipo_opera: 'Ingreso', contable:'Si'},
							{nom_opera: 'Cheque Pagador', abrev_opera: 'CHPA', tipo_opera: 'Ingreso', contable:'Si'},
							{nom_opera: 'Venta de Moneda Extranjera', abrev_opera: 'VEME', tipo_opera: 'Ingreso', contable:'Si'},
							{nom_opera: 'Compra de Moneda Extranjera', abrev_opera: 'COME', tipo_opera: 'Salida', contable:'Si'}
							])