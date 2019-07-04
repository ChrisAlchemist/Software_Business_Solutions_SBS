--DECLARE @FECHA_2 DATETIME = GETDATE(), @FECHA_1 DATETIME = '19940930'

--select year(@fecha_2) - year(@fecha_1)
---      case
--                when
--                    substring(convert(varchar, @fecha_1, 112), 5, 4) >
--                    substring(convert(varchar, @fecha_2, 112), 5, 4)
--                            then 1
--                else 0
--        end

declare @numeroSocio int =837648
DECLARE @edad_Socio int, @FECHA_2 DATETIME = GETDATE(), @FECHA_1 DATETIME = (select * from HAPE..persona where numero =@numeroSocio)

				set @edad_Socio =
				( select year(@fecha_2) - year(@fecha_1)
				-      case
						when
							substring(convert(varchar, @fecha_1, 112), 5, 4) >
							substring(convert(varchar, @fecha_2, 112), 5, 4)
									then 1
						else 0
				end
				)