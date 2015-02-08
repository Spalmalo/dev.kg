class FlagsController < ApplicationController

  def index
    @flags = %w[Abkhazia Afghanistan Aland Albania Algeria
                American-Samoa Andorra Angola Anguilla
                Antarctica Antigua-and-Barbuda Argentina
                Armenia Aruba Australia Austria Azerbaijan
                Bahamas Bahrain Bangladesh Barbados
                Basque-Country Belarus Belgium Belize Benin
                Bermuda Bhutan Bolivia Bosnia-and-Herzegovina
                Botswana Brazil British-Antarctic-Territory
                British-Virgin-Islands Brunei Bulgaria
                Burkina-Faso Burundi Cambodia Cameroon Canada
                Canary-Islands Cape-Verde Cayman-Islands
                Central-African-Republic Chad Chile China
                Christmas-Island Cocos-Keeling-Islands
                Colombia Commonwealth Comoros Cook-Islands
                Costa-Rica Cote-dIvoire Croatia Cuba Curacao
                Cyprus Czech-Republic
                Democratic-Republic-of-the-Congo Denmark
                Djibouti Dominican-Republic Dominica
                East-Timor Ecuador Egypt El-Salvador England
                Equatorial-Guinea Eritrea Estonia Ethiopia
                European-Union Falkland-Islands Faroes Fiji
                Finland France French-Polynesia
                French-Southern-Territories Gabon Gambia
                Georgia Germany Ghana Gibraltar GoSquared
                Greece Greenland Grenada Guam Guatemala
                Guernsey Guinea-Bissau Guinea Guyana Haiti
                Honduras Hong-Kong Hungary Iceland India
                Indonesia Iran Iraq Ireland Isle-of-Man Israel
                Italy Jamaica Japan Jersey Jordan Kazakhstan
                Kenya Kiribati Kosovo Kuwait Kyrgyzstan Laos
                Latvia Lebanon Lesotho Liberia Libya
                Liechtenstein Lithuania Luxembourg Macau
                Macedonia Madagascar Malawi Malaysia Maldives
                Mali Malta Marshall-Islands Mars Martinique
                Mauritania Mauritius Mayotte Mexico Micronesia
                Moldova Monaco Mongolia Montenegro Montserrat
                Morocco Mozambique Myanmar Nagorno-Karabakh
                Namibia NATO Nauru Nepal Netherlands-Antilles
                Netherlands New-Caledonia New-Zealand
                Nicaragua Nigeria Niger Niue Norfolk-Island
                Northern-Cyprus Northern-Mariana-Islands
                North-Korea Norway Olympics Oman Pakistan
                Palau Palestine Panama Papua-New-Guinea
                Paraguay Peru Philippines Pitcairn-Islands
                Poland Portugal Puerto-Rico Qatar Red-Cross
                Republic-of-the-Congo Romania Russia Rwanda
                Saint-Barthelemy Saint-Helena
                Saint-Kitts-and-Nevis Saint-Lucia Saint-Martin
                Saint-Vincent-and-the-Grenadines Samoa
                San-Marino Sao-Tome-and-Principe Saudi-Arabia
                Scotland Senegal Serbia Seychelles
                Sierra-Leone Singapore Slovakia Slovenia
                Solomon-Islands Somalia Somaliland South-Africa
                South-Georgia-and-the-South-Sandwich-Islands
                South-Korea South-Ossetia South-Sudan Spain
                Sri-Lanka Sudan Suriname Swaziland Sweden
                Switzerland Syria Taiwan Tajikistan Tanzania
                Thailand Togo Tokelau Tonga Trinidad-and-Tobago
                Tunisia Turkey Turkmenistan
                Turks-and-Caicos-Islands Tuvalu Uganda Ukraine
                United-Arab-Emirates United-Kingdom
                United-Nations United-States Uruguay
                US-Virgin-Islands Uzbekistan Vanuatu
                Vatican-City Venezuela Vietnam Wales
                Wallis-And-Futuna Western-Sahara Yemen
                Zambia Zimbabwe]
  end
end