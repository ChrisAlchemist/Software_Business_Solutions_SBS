USE HAPE
GO
--SP_IMAGEN_INSERTA_TBL_IMAGEN_ALTA_SOCIOS

declare @xml xml='';

select @xml='

<NewDataSet>
  <xs:schema id="NewDataSet" xmlns="" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata">
    <xs:element name="NewDataSet" msdata:IsDataSet="true" msdata:MainDataTable="Table" msdata:UseCurrentLocale="true">
      <xs:complexType>
        <xs:choice minOccurs="0" maxOccurs="unbounded">
          <xs:element name="Table">
            <xs:complexType>
              <xs:sequence>
                <xs:element name="C�digo_x0020_de_x0020_la_x0020_reservaci�n" type="xs:string" minOccurs="0" />
                <xs:element name="Nombres" type="xs:string" minOccurs="0" />
                <xs:element name="Apellidos" type="xs:string" minOccurs="0" />
                <xs:element name="Correo_x0020_electr�nico" type="xs:string" minOccurs="0" />
                <xs:element name="Vendedor" type="xs:string" minOccurs="0" />
                <xs:element name="M�todo_x0020_de_x0020_pago" type="xs:string" minOccurs="0" />
                <xs:element name="N�mero_x0020_de_x0020_boletos" type="xs:double" minOccurs="0" />
                <xs:element name="Boletos_x0020_por_x0020_tipo" type="xs:string" minOccurs="0" />
                <xs:element name="Total" type="xs:double" minOccurs="0" />
                <xs:element name="Subtotal" type="xs:double" minOccurs="0" />
                <xs:element name="C�digo_x0020_de_x0020_promoci�n" type="xs:string" minOccurs="0" />
                <xs:element name="Descuento_x0020_de_x0020_promoci�n" type="xs:double" minOccurs="0" />
                <xs:element name="Estado_x0020_del_x0020_pago" type="xs:string" minOccurs="0" />
                <xs:element name="Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa" type="xs:string" minOccurs="0" />
                <xs:element name="Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa" type="xs:string" minOccurs="0" />
                <xs:element name="WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_" type="xs:double" minOccurs="0" />
                <xs:element name="Facebook_x0020__x002B__x0020__x0028_Historico_x0029_" type="xs:string" minOccurs="0" />
                <xs:element name="Twitter_x0020__x002B__x0020__x0028_Historico_x0029_" type="xs:string" minOccurs="0" />
                <xs:element name="Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_" type="xs:string" minOccurs="0" />
                <xs:element name="Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_" type="xs:double" minOccurs="0" />
                <xs:element name="Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_" type="xs:string" minOccurs="0" />
              </xs:sequence>
            </xs:complexType>
          </xs:element>
        </xs:choice>
      </xs:complexType>
    </xs:element>
  </xs:schema>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>e6222492ac</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Fernando</Nombres>
    <Apellidos>Prueba Uno</Apellidos>
    <Correo_x0020_electr�nico>fer_77773@hotmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>1 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>23/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>23/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>cb47504af0</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Prueba </Nombres>
    <Apellidos>Piloto Cmv</Apellidos>
    <Correo_x0020_electr�nico>fernando.arellano@cedicoop.coop</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>2 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>22/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>22/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>7833d28c16</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Fernando</Nombres>
    <Apellidos>Arellano Martinez</Apellidos>
    <Correo_x0020_electr�nico>fer_77773@hotmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>3 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431877483</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Administraci�n</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>47</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>0503407k</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>a43821d384</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Maritza</Nombres>
    <Apellidos>Espinoza Hern�ndez </Apellidos>
    <Correo_x0020_electr�nico>maryespinoza942@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>4 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434837644</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Maritza Espinoza</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>164059H</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>66bd8bf617</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Marisol</Nombres>
    <Apellidos>Dominguez Gomez</Apellidos>
    <Correo_x0020_electr�nico>marisoldominguez779@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>5 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4341324790</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Sol dmgz gomez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1640063J</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>60d6eb7ee5</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Mitzi Renata </Nombres>
    <Apellidos>�lvarez S�nchez </Apellidos>
    <Correo_x0020_electr�nico>renataalvarezsanchez09@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>6 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirm�ndote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431082847</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Renata Alvarez S�nchez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1515413E</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>73131fe4b3</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Lorena Janeth</Nombres>
    <Apellidos>Luna Flires</Apellidos>
    <Correo_x0020_electr�nico>jani_ljlf@hotmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>7 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s participando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431389579</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Mnfw loraine</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1026715c</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>9bb38b0fd5</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Paulina Yaneth </Nombres>
    <Apellidos>Zaragoza Lucas</Apellidos>
    <Correo_x0020_electr�nico>pzaragozalucas@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>8 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4341083196</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Paulina ZL</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1639863x</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>4664def3d0</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Gemali Gidalty</Nombres>
    <Apellidos>Zamudio Rocha</Apellidos>
    <Correo_x0020_electr�nico>gemali.gi20@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>9 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4436829721</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Gemali Gidalty Zaudio</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1640802H</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>1469e8b3fd</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Jessica Lucero</Nombres>
    <Apellidos>Maga�a Barajas</Apellidos>
    <Correo_x0020_electr�nico>lucero.magana767@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>10 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433851110</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Lucero Maga�a</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1639864G</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>31a358fc6a</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Jos� Ignacio</Nombres>
    <Apellidos>Silva Torres </Apellidos>
    <Correo_x0020_electr�nico>ignaciotorres120@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>11 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434384981</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Ignacio Silva torres </Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1641808x</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>207fbd3c2d</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Sergio Andre</Nombres>
    <Apellidos>Hernandez Cuevas </Apellidos>
    <Correo_x0020_electr�nico>andrehernandez96.sahc@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>12 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434484771</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Andre hernandez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1358404B</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>cb1aba6b06</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Angelina</Nombres>
    <Apellidos>Garc�a Ambriz</Apellidos>
    <Correo_x0020_electr�nico>angymels.g.a@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>13 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431981502</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Angy Garc�a</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1357778E</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>74280eafba</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Eldai</Nombres>
    <Apellidos>Sanchez Flores</Apellidos>
    <Correo_x0020_electr�nico>eldaisaflo2101@outlook.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>14 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4351121028</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Eldai SF</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1640288C</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>5690314c88</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Ivan</Nombres>
    <Apellidos>L�pez Cisneros</Apellidos>
    <Correo_x0020_electr�nico>ivanlc33@outlook.es</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>15 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4436827511</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Iv�n L�pez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1640043x</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>1129944b79</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Enrique</Nombres>
    <Apellidos>Martinez Hernandez</Apellidos>
    <Correo_x0020_electr�nico>enriquemher1998@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>16 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431072441</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Enrique Martinez Hernandez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1639815E</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>2901c742ab</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>N�stor Martin</Nombres>
    <Apellidos>Ben�tez Correa</Apellidos>
    <Correo_x0020_electr�nico>chuybee26@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>17 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433495153</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Nestor Benitez Correa</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1640017B</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>1a2aa292e5</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Shalia Lizbeth</Nombres>
    <Apellidos>Alonso Rodr�guez</Apellidos>
    <Correo_x0020_electr�nico>shali.alro@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>18 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4351007191</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Shalia lizbeth Alonso Rodr�guez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1640128J</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>384ed07c61</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>�ngel Mart�n </Nombres>
    <Apellidos>Cerna Dom�nguez</Apellidos>
    <Correo_x0020_electr�nico>angelthetarget@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>19 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431426072</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>www.facebook.com/angelmartin</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1340756F</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>7af6afe18c</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Adrian</Nombres>
    <Apellidos>Mart�nez Salgado</Apellidos>
    <Correo_x0020_electr�nico>adriano10138@hotmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>20 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431076269</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>www.facebook.com/Adrian Martinez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1639870K</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>df5c7cbbdd</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Ninfa Paola</Nombres>
    <Apellidos>Garcidue�as Hernandez</Apellidos>
    <Correo_x0020_electr�nico>ninfa_garci@hotmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>21 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434405777</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Ninfa Garcidue�as</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1583551K</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>2c370a76a2</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Jes�s Alexis </Nombres>
    <Apellidos>Herrera Bedolla</Apellidos>
    <Correo_x0020_electr�nico>alexis_chuchin1@outlook.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>22 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433701436</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Alexis herrera</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1341132k</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>67e87f299c</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Blanca Lizbeth</Nombres>
    <Apellidos>Rivera Zamudio</Apellidos>
    <Correo_x0020_electr�nico>blrzamudio30@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>23 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433706061</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Liz Rivera Zamudio</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1640312H</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>9018fcbccd</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Karla Lizbeth </Nombres>
    <Apellidos>L�pez Medina </Apellidos>
    <Correo_x0020_electr�nico>lopezmedinakarlalizbeth@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>24 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434832401</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Karla L�pez </Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1341291H</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>eca4cfadcd</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Alejandro</Nombres>
    <Apellidos>Torres Mart�nez </Apellidos>
    <Correo_x0020_electr�nico>axel_torres_23@hotmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>25 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434914164</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Alejandro Torres</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1583569K</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>88277ea4fa</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Iv�n </Nombres>
    <Apellidos>L�pez Cisneros</Apellidos>
    <Correo_x0020_electr�nico>ivanlc33@outlook.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>26 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4436827511</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Iv�n L�pez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1640043x</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>d791bb4a11</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Juan Carlos </Nombres>
    <Apellidos>Mej�a Vargas </Apellidos>
    <Correo_x0020_electr�nico>carlosmv9809@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>27 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433571463</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Carlos Mej�a </Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1357784x </Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>1d7817d45d</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Alfredo</Nombres>
    <Apellidos>Rocha Ochoa</Apellidos>
    <Correo_x0020_electr�nico>alfre2897@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>28 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433953648</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Alfredo Rocha Ochoa</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1207899A</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>c2fef06bad</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Francisco Javier</Nombres>
    <Apellidos>Andrade L�pez</Apellidos>
    <Correo_x0020_electr�nico>franciskoandrade.123@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>29 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4381146689</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Francisco Andrade</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1640117E</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>75b9ba7ee7</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Karla Sarah� </Nombres>
    <Apellidos>Ar�valo Herrera</Apellidos>
    <Correo_x0020_electr�nico>arevaloherrerak@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>30 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434754044</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Karla Arevalo </Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1640001X</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>259179fbfe</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Luis Alfonso </Nombres>
    <Apellidos>Sosa Ramos </Apellidos>
    <Correo_x0020_electr�nico>alfonso.sosa.ramos@gmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>31 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431152154</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>4431152154</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contadur�a</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>12</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>1208482H</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>caaac40062</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Fernando</Nombres>
    <Apellidos>Arellano Mart�nez </Apellidos>
    <Correo_x0020_electr�nico>fer_77773@hotmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>32 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>03/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>03/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431877483</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Administraci�n</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>47</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>0503407k</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>0af60974fe</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Fernando </Nombres>
    <Apellidos>Arellano Mart�nez </Apellidos>
    <Correo_x0020_electr�nico>fer_77773@hotmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>33 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>03/04/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>03/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431877483</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Administraci�n</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>47</Secci�n_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>0503407k</Matr�cula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>3e3f8e89e3</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Erika</Nombres>
    <Apellidos>Arellano Martinez</Apellidos>
    <Correo_x0020_electr�nico>erika.arellano@cedicoop.coop</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>34 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433961412</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>www.facebook.com/ERIKAARELLANO/</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>09e88f1346</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Omar Eli</Nombres>
    <Apellidos>Roldan Corona</Apellidos>
    <Correo_x0020_electr�nico>omar.roldan@cedicoop.coop</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>35 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4432249422</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>www.facebook.com/Omar Roldan Corona</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>9dfdfcee90</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Maribel</Nombres>
    <Apellidos>Gutierrez</Apellidos>
    <Correo_x0020_electr�nico>maribel.gutierrez@cedicoop.coop</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>36 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431354883</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>www.faebook.com/maribel gutierrez/</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>b676212683</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Fer Prueba Iphone</Nombres>
    <Apellidos>Arellano</Apellidos>
    <Correo_x0020_electr�nico>fer_77773@hotmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>37 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431877483</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <C�digo_x0020_de_x0020_la_x0020_reservaci�n>47efdd1c59</C�digo_x0020_de_x0020_la_x0020_reservaci�n>
    <Nombres>Participante</Nombres>
    <Apellidos>Prueba Uno</Apellidos>
    <Correo_x0020_electr�nico>fer_77773@hotmail.com</Correo_x0020_electr�nico>
    <M�todo_x0020_de_x0020_pago>Gratis</M�todo_x0020_de_x0020_pago>
    <N�mero_x0020_de_x0020_boletos>1</N�mero_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>38 Deber�s presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegar� un SMS confirmandote que est�s particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoci�n>0</Descuento_x0020_de_x0020_promoci�n>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_de_x0020_creaci�n_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
  </Table>
</NewDataSet>'



SELECT

�� �XCol.value('(C�digo_x0020_de_x0020_la_x0020_reservaci�n)[1]','varchar(30)') codigo_,

	XCol.value('(Nombres)[1]', 'varchar(30)') Nombre_,

�� �XCol.value('(Apellidos)[1]','varchar(40)') Apellidos_,

�� �XCol.value('(Correo_x0020_electr�nico)[1]','varchar(30)') Correo_,
	
	XCol.value('(WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_)[1]','varchar(30)') Telefono_
	
�� �into #infPersona



FROM�

�� �@xml.nodes('/NewDataSet/Table') AS XTbl(XCol)

--create table tabla_real(rfc varchar(20), nombre varchar(20), Apellido_P varchar(20), Apellido_m varchar(20) )

--insert into tabla_real(rfc) values('5')
--GO
--insert into tabla_real(rfc)

--insert into tabla_real(rfc, nombre, Apellido_m,Apellido_P) values('5', 'Juan','Van', 'Dame')

	if exists(select codigo from HAPE..TBL_CEDICOOP_PERSONAS where codigo  in(select codigo_ from #infPersona))
	begin
	--print 'Existe'
		update TBL_CEDICOOP_PERSONAS 
		set 
			codigo =personasTemp.codigo_,
			nombre = personasTemp.Nombre_,
			apellidos = personasTemp.Apellidos_,
			correo = personasTemp.Correo_,
			telefono = personasTemp.Telefono_,
			ocupado = 1,
			numero = null
		from  TBL_CEDICOOP_PERSONAS personas, #infPersona personasTemp	
	end

	insert into TBL_CEDICOOP_PERSONAS(codigo, nombre,apellidos,correo,telefono,fecha_alta,ocupado, numero) 
	select codigo_, nombre_,apellidos_,correo_,telefono_, GETDATE(), 0,null from #infPersona where codigo_ not in (select codigo from HAPE..TBL_CEDICOOP_PERSONAS)
	

--insert into TBL_CEDICOOP_PERSONAS(codigo, nombre,apellidos,correo,telefono,fecha_alta,ocupado, numero) 
--select codigo_, nombre_,apellidos_,correo_,telefono_, GETDATE(), @Ocupado,null from #infosocios where codigo_ not in (select codigo from HAPE..TBL_CEDICOOP_PERSONAS)


select * from #infPersona

select * from TBL_CEDICOOP_PERSONAS


drop table #infPersona

--drop table tabla_real

--delete from TBL_CEDICOOP_PERSONAS
--DBCC CHECKIDENT ('TBL_CEDICOOP_PERSONAS', RESEED,0)