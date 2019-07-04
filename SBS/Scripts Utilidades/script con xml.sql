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
                <xs:element name="Código_x0020_de_x0020_la_x0020_reservación" type="xs:string" minOccurs="0" />
                <xs:element name="Nombres" type="xs:string" minOccurs="0" />
                <xs:element name="Apellidos" type="xs:string" minOccurs="0" />
                <xs:element name="Correo_x0020_electrónico" type="xs:string" minOccurs="0" />
                <xs:element name="Vendedor" type="xs:string" minOccurs="0" />
                <xs:element name="Método_x0020_de_x0020_pago" type="xs:string" minOccurs="0" />
                <xs:element name="Número_x0020_de_x0020_boletos" type="xs:double" minOccurs="0" />
                <xs:element name="Boletos_x0020_por_x0020_tipo" type="xs:string" minOccurs="0" />
                <xs:element name="Total" type="xs:double" minOccurs="0" />
                <xs:element name="Subtotal" type="xs:double" minOccurs="0" />
                <xs:element name="Código_x0020_de_x0020_promoción" type="xs:string" minOccurs="0" />
                <xs:element name="Descuento_x0020_de_x0020_promoción" type="xs:double" minOccurs="0" />
                <xs:element name="Estado_x0020_del_x0020_pago" type="xs:string" minOccurs="0" />
                <xs:element name="Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa" type="xs:string" minOccurs="0" />
                <xs:element name="Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa" type="xs:string" minOccurs="0" />
                <xs:element name="WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_" type="xs:double" minOccurs="0" />
                <xs:element name="Facebook_x0020__x002B__x0020__x0028_Historico_x0029_" type="xs:string" minOccurs="0" />
                <xs:element name="Twitter_x0020__x002B__x0020__x0028_Historico_x0029_" type="xs:string" minOccurs="0" />
                <xs:element name="Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_" type="xs:string" minOccurs="0" />
                <xs:element name="Sección_x0020__x002B__x0020__x0028_Historico_x0029_" type="xs:double" minOccurs="0" />
                <xs:element name="Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_" type="xs:string" minOccurs="0" />
              </xs:sequence>
            </xs:complexType>
          </xs:element>
        </xs:choice>
      </xs:complexType>
    </xs:element>
  </xs:schema>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>e6222492ac</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Fernando</Nombres>
    <Apellidos>Prueba Uno</Apellidos>
    <Correo_x0020_electrónico>fer_77773@hotmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>1 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>23/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>23/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>cb47504af0</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Prueba </Nombres>
    <Apellidos>Piloto Cmv</Apellidos>
    <Correo_x0020_electrónico>fernando.arellano@cedicoop.coop</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>2 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>22/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>22/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>7833d28c16</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Fernando</Nombres>
    <Apellidos>Arellano Martinez</Apellidos>
    <Correo_x0020_electrónico>fer_77773@hotmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>3 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431877483</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Administración</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>47</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>0503407k</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>a43821d384</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Maritza</Nombres>
    <Apellidos>Espinoza Hernández </Apellidos>
    <Correo_x0020_electrónico>maryespinoza942@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>4 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434837644</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Maritza Espinoza</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>164059H</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>66bd8bf617</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Marisol</Nombres>
    <Apellidos>Dominguez Gomez</Apellidos>
    <Correo_x0020_electrónico>marisoldominguez779@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>5 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4341324790</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Sol dmgz gomez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1640063J</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>60d6eb7ee5</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Mitzi Renata </Nombres>
    <Apellidos>Álvarez Sánchez </Apellidos>
    <Correo_x0020_electrónico>renataalvarezsanchez09@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>6 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmándote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431082847</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Renata Alvarez Sánchez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1515413E</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>73131fe4b3</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Lorena Janeth</Nombres>
    <Apellidos>Luna Flires</Apellidos>
    <Correo_x0020_electrónico>jani_ljlf@hotmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>7 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás participando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431389579</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Mnfw loraine</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1026715c</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>9bb38b0fd5</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Paulina Yaneth </Nombres>
    <Apellidos>Zaragoza Lucas</Apellidos>
    <Correo_x0020_electrónico>pzaragozalucas@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>8 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4341083196</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Paulina ZL</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1639863x</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>4664def3d0</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Gemali Gidalty</Nombres>
    <Apellidos>Zamudio Rocha</Apellidos>
    <Correo_x0020_electrónico>gemali.gi20@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>9 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4436829721</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Gemali Gidalty Zaudio</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1640802H</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>1469e8b3fd</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Jessica Lucero</Nombres>
    <Apellidos>Magaña Barajas</Apellidos>
    <Correo_x0020_electrónico>lucero.magana767@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>10 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433851110</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Lucero Magaña</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1639864G</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>31a358fc6a</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>José Ignacio</Nombres>
    <Apellidos>Silva Torres </Apellidos>
    <Correo_x0020_electrónico>ignaciotorres120@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>11 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434384981</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Ignacio Silva torres </Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1641808x</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>207fbd3c2d</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Sergio Andre</Nombres>
    <Apellidos>Hernandez Cuevas </Apellidos>
    <Correo_x0020_electrónico>andrehernandez96.sahc@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>12 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434484771</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Andre hernandez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1358404B</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>cb1aba6b06</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Angelina</Nombres>
    <Apellidos>García Ambriz</Apellidos>
    <Correo_x0020_electrónico>angymels.g.a@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>13 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431981502</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Angy García</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1357778E</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>74280eafba</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Eldai</Nombres>
    <Apellidos>Sanchez Flores</Apellidos>
    <Correo_x0020_electrónico>eldaisaflo2101@outlook.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>14 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4351121028</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Eldai SF</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1640288C</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>5690314c88</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Ivan</Nombres>
    <Apellidos>López Cisneros</Apellidos>
    <Correo_x0020_electrónico>ivanlc33@outlook.es</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>15 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4436827511</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Iván López</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1640043x</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>1129944b79</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Enrique</Nombres>
    <Apellidos>Martinez Hernandez</Apellidos>
    <Correo_x0020_electrónico>enriquemher1998@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>16 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431072441</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Enrique Martinez Hernandez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1639815E</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>2901c742ab</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Néstor Martin</Nombres>
    <Apellidos>Benítez Correa</Apellidos>
    <Correo_x0020_electrónico>chuybee26@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>17 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433495153</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Nestor Benitez Correa</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1640017B</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>1a2aa292e5</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Shalia Lizbeth</Nombres>
    <Apellidos>Alonso Rodríguez</Apellidos>
    <Correo_x0020_electrónico>shali.alro@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>18 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4351007191</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Shalia lizbeth Alonso Rodríguez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1640128J</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>384ed07c61</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Ángel Martín </Nombres>
    <Apellidos>Cerna Domínguez</Apellidos>
    <Correo_x0020_electrónico>angelthetarget@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>19 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431426072</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>www.facebook.com/angelmartin</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1340756F</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>7af6afe18c</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Adrian</Nombres>
    <Apellidos>Martínez Salgado</Apellidos>
    <Correo_x0020_electrónico>adriano10138@hotmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>20 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431076269</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>www.facebook.com/Adrian Martinez</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1639870K</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>df5c7cbbdd</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Ninfa Paola</Nombres>
    <Apellidos>Garcidueñas Hernandez</Apellidos>
    <Correo_x0020_electrónico>ninfa_garci@hotmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>21 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434405777</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Ninfa Garcidueñas</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1583551K</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>2c370a76a2</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Jesús Alexis </Nombres>
    <Apellidos>Herrera Bedolla</Apellidos>
    <Correo_x0020_electrónico>alexis_chuchin1@outlook.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>22 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433701436</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Alexis herrera</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1341132k</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>67e87f299c</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Blanca Lizbeth</Nombres>
    <Apellidos>Rivera Zamudio</Apellidos>
    <Correo_x0020_electrónico>blrzamudio30@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>23 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433706061</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Liz Rivera Zamudio</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1640312H</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>9018fcbccd</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Karla Lizbeth </Nombres>
    <Apellidos>López Medina </Apellidos>
    <Correo_x0020_electrónico>lopezmedinakarlalizbeth@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>24 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434832401</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Karla López </Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1341291H</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>eca4cfadcd</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Alejandro</Nombres>
    <Apellidos>Torres Martínez </Apellidos>
    <Correo_x0020_electrónico>axel_torres_23@hotmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>25 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434914164</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Alejandro Torres</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1583569K</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>88277ea4fa</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Iván </Nombres>
    <Apellidos>López Cisneros</Apellidos>
    <Correo_x0020_electrónico>ivanlc33@outlook.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>26 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4436827511</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Iván López</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1640043x</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>d791bb4a11</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Juan Carlos </Nombres>
    <Apellidos>Mejía Vargas </Apellidos>
    <Correo_x0020_electrónico>carlosmv9809@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>27 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433571463</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Carlos Mejía </Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1357784x </Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>1d7817d45d</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Alfredo</Nombres>
    <Apellidos>Rocha Ochoa</Apellidos>
    <Correo_x0020_electrónico>alfre2897@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>28 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433953648</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Alfredo Rocha Ochoa</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1207899A</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>c2fef06bad</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Francisco Javier</Nombres>
    <Apellidos>Andrade López</Apellidos>
    <Correo_x0020_electrónico>franciskoandrade.123@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>29 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4381146689</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Francisco Andrade</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1640117E</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>75b9ba7ee7</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Karla Sarahí </Nombres>
    <Apellidos>Arévalo Herrera</Apellidos>
    <Correo_x0020_electrónico>arevaloherrerak@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>30 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4434754044</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Karla Arevalo </Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1640001X</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>259179fbfe</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Luis Alfonso </Nombres>
    <Apellidos>Sosa Ramos </Apellidos>
    <Correo_x0020_electrónico>alfonso.sosa.ramos@gmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>31 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>10/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431152154</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>4431152154</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Contaduría</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>12</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>1208482H</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>caaac40062</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Fernando</Nombres>
    <Apellidos>Arellano Martínez </Apellidos>
    <Correo_x0020_electrónico>fer_77773@hotmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>32 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>03/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>03/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431877483</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Administración</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>47</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>0503407k</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>0af60974fe</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Fernando </Nombres>
    <Apellidos>Arellano Martínez </Apellidos>
    <Correo_x0020_electrónico>fer_77773@hotmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>33 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>03/04/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>03/04/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431877483</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>Administración</Licenciatura_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Sección_x0020__x002B__x0020__x0028_Historico_x0029_>47</Sección_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>0503407k</Matrícula_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>3e3f8e89e3</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Erika</Nombres>
    <Apellidos>Arellano Martinez</Apellidos>
    <Correo_x0020_electrónico>erika.arellano@cedicoop.coop</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>34 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4433961412</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>www.facebook.com/ERIKAARELLANO/</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>09e88f1346</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Omar Eli</Nombres>
    <Apellidos>Roldan Corona</Apellidos>
    <Correo_x0020_electrónico>omar.roldan@cedicoop.coop</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>35 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4432249422</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>www.facebook.com/Omar Roldan Corona</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>9dfdfcee90</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Maribel</Nombres>
    <Apellidos>Gutierrez</Apellidos>
    <Correo_x0020_electrónico>maribel.gutierrez@cedicoop.coop</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>36 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431354883</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>www.faebook.com/maribel gutierrez/</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_ />
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>b676212683</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Fer Prueba Iphone</Nombres>
    <Apellidos>Arellano</Apellidos>
    <Correo_x0020_electrónico>fer_77773@hotmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>37 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
    <WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>4431877483</WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Facebook_x0020__x002B__x0020__x0028_Historico_x0029_>
    <Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>Ferintox</Twitter_x0020__x002B__x0020__x0028_Historico_x0029_>
  </Table>
  <Table>
    <Código_x0020_de_x0020_la_x0020_reservación>47efdd1c59</Código_x0020_de_x0020_la_x0020_reservación>
    <Nombres>Participante</Nombres>
    <Apellidos>Prueba Uno</Apellidos>
    <Correo_x0020_electrónico>fer_77773@hotmail.com</Correo_x0020_electrónico>
    <Método_x0020_de_x0020_pago>Gratis</Método_x0020_de_x0020_pago>
    <Número_x0020_de_x0020_boletos>1</Número_x0020_de_x0020_boletos>
    <Boletos_x0020_por_x0020_tipo>38 Deberás presentar este ticket al momento de abrir tu cuenta en Caja Morelia Valladolid. Posteriormente te llegará un SMS confirmandote que estás particioando en una rifa.</Boletos_x0020_por_x0020_tipo>
    <Total>0</Total>
    <Subtotal>0</Subtotal>
    <Descuento_x0020_de_x0020_promoción>0</Descuento_x0020_de_x0020_promoción>
    <Estado_x0020_del_x0020_pago>Pagada</Estado_x0020_del_x0020_pago>
    <Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_de_x0020_creación_x0020_dd_x002F_mm_x002F_aaaa>
    <Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>19/02/2019</Fecha_x0020_del_x0020_pago_x0020_dd_x002F_mm_x002F_aaaa>
  </Table>
</NewDataSet>'



SELECT

    XCol.value('(Código_x0020_de_x0020_la_x0020_reservación)[1]','varchar(30)') codigo_,

	XCol.value('(Nombres)[1]', 'varchar(30)') Nombre_,

    XCol.value('(Apellidos)[1]','varchar(40)') Apellidos_,

    XCol.value('(Correo_x0020_electrónico)[1]','varchar(30)') Correo_,
	
	XCol.value('(WhatsApp_x0020__x002B__x0020__x0028_Historico_x0029_)[1]','varchar(30)') Telefono_
	
    into #infPersona



FROM 

    @xml.nodes('/NewDataSet/Table') AS XTbl(XCol)

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