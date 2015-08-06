require 'test_helper'

class GetOrderTest < Minitest::Test
  include ActiveFulfillment::Test::Fixtures
  include ActiveFulfillment::DotcomDistribution

  def setup
    ActiveFulfillment::Base.mode = :test

    xml = <<-SQL
      <?xml version="1.0" encoding="UTF-8"?>
        <response xmlns:a="http://schemas.datacontract.org/2004/07/DCDAPIService">
        <shipments>
          <a:shipment>
            <a:client_order_number>4E717D91B990</a:client_order_number>
            <a:customer_number>lass95842</a:customer_number>
            <a:dcd_order_number>9004859200</a:dcd_order_number>
            <a:order_date>10/12/2011 12:00:00 AM</a:order_date>
            <a:order_shipping_handling>0.00</a:order_shipping_handling>
            <a:order_status>Shipped</a:order_status>
            <a:order_subtotal>0.0000</a:order_subtotal>
            <a:order_tax>0.00</a:order_tax>
            <a:order_total>0.0000</a:order_total>
            <a:ship_date>10/13/2011</a:ship_date>
            <a:ship_items>
              <a:ship_item>
                <a:carrier>UPS</a:carrier>
                <a:carton_id>C123456789</a:carton_id>
                <a:item_description>no size Tin Word Halloween Or</a:item_description>
                <a:item_unit_price>0.00</a:item_unit_price>
                <a:order_line_number>1</a:order_line_number>
                <a:client_line_number>1</a:client_line_number>
                <a:quantity_shipped>1.00</a:quantity_shipped>
                <a:serial_lot_number />
                <a:service>SurePost</a:service>
                <a:sku>PRI-E61-B1C-D41</a:sku>
                <a:tracking_number>1ZX78240YW71511871</a:tracking_number>
              </a:ship_item>
            </a:ship_items>
            <a:ship_weight>0.95</a:ship_weight>
            <a:shipto_addr1>7220 Candlestick Way</a:shipto_addr1>
            <a:shipto_addr2 />
            <a:shipto_city>Sacramento</a:shipto_city>
            <a:shipto_email_address>crazy4chows@sbcglobal.net</a:shipto_email_address>
            <a:shipto_name>Cheryl Douglass</a:shipto_name>
            <a:shipto_state>CA</a:shipto_state>
            <a:shipto_zip>95842</a:shipto_zip>
          </a:shipment>
        </shipments>
      </response>
    SQL

    @shipment = Shipment.from_response(xml).data.first

  end


  def test_shipment_deserialization
    assert_equal @shipment.client_order_number, '4E717D91B990'
  end

end
