module UsersHelper


  def fetch_agent_data( user )

    response = soap_response

    #binding.pry

    if response.present? && response.body[:fault].blank? && response.http.code == 200

      @tarifs = response.body[:get_tarifs_response][:return][:Тариф]


      @tarifs.each do |tarif|

        t = Tarif.find_or_create_by(type_t:tarif[:ТипТарифа], platform:tarif[:Площадка])

        t.update  type_t:               tarif[:ТипТарифа],
                  platform:             tarif[:Площадка],
                  rate:                 tarif[:Ставка],
                  dop_rate:             tarif[:СтавкаДополнительная],
                  client_rate:          tarif[:СтавкаКонечника],
                  minimum:              tarif[:Минималка],
                  personal_number_flag: tarif[:ЕстьЛицевойСчет],
                  client_dop_rate:      tarif[:СтавкаКонечникаДополнительная]

      end

        true

    else

        false

    end

  end

  def soap_response
    begin
      Savon_client::CLIENT.call(:get_tarifs)
    rescue (Timeout::Error || Errno::ECONNRESET) => e
      puts "-- #{e} --"
    end
  end

end

