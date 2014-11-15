# coding: UTF-8
module ApplicationHelper
  # SETTINGS
  def print_debug
    return false
  end
  
  # PRECONDITIONS
  def check_pre(assertion)
    if (!assertion)
      raise(RuntimeError, 'Precondition violated!')
    end
  end
  
  # CONVERTIONS
  def get_html_safe_string(string)
    return string.gsub("\n", "<br/>").html_safe
  end
  
  def get_german_date(date)
    months = ["Januar", "Feburar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"]
    return date.day.to_s + ". " + months[date.month - 1] + " " + date.year.to_s
  end
  
  def get_german_date_ordinal(date)
    return date.day.to_s + ". " + date.month.to_s + " " + date.year.to_s
  end
  
  def get_german_date_time_ordinal(datetime)
    return datetime.strftime("%d.%m.%Y %H:%M:%S")
  end
  
  def float_to_euro_string(value)
    return "#{format("%.2f", value).sub('.', ',')} EUR"
  end
  
  # VIEW
  def viewtag_admin
    return "<span style=\"color: #990000\"><strong>[ADMINISTRATION]</strong></span>".html_safe
  end
  
  def viewtag_seperator
    return "<hr style=\"display: block; height:1px; border:none; color:#d3d7d9; background-color:#d3d7d9; margin: 30px -50px 30px -50px;\"/>".html_safe
  end
  
  def viewtag_seperator_without_space_top
    return "<hr style=\"display: block; height:1px; border:none; color:#d3d7d9; background-color:#d3d7d9; margin: 0px -50px 30px -50px;\"/>".html_safe
  end
  
  def viewtag_seperator_without_space_bottom
    return "<hr style=\"display: block; height:1px; border:none; color:#d3d7d9; background-color:#d3d7d9; margin: 30px -50px 0px -50px;\"/>".html_safe
  end
  
  # TEST DATA
  def generate_admins
    User.new(
      :firstname => "Ad",
      :lastname => "min",
      :email => "ad@min.de",
      :password => "ad@min",
      :password_confirmation => "ad@min",
      :role => 0
    ).save
  end
  
  def generate_menu_with_tag(name)
    Tag.new(:name => name).save
    Menu.new(:name => name).save

    MenuToTag.new(
        :menu => Menu.where(:name => name).first,
        :tag => Tag.where(:name => name).first).save
  end

  def generate_article_with_tags(name, description, price, tags)
    Article.new(:name => name, :description => description, :price => price).save

    tags.each {|item| ArticleToTag.new(
        :article => Article.where(:name => name).first,
        :tag => Tag.where(:name => item).first).save
    }
  end

  def generate_article_structure(upper_part, lower_part, amount)
    ArticleStructure.new(
        :upper_part => Article.where(:name => upper_part).first,
        :lower_part => Article.where(:name => lower_part).first,
        :amount => amount).save
  end

  def test
#    # reset everything
#    Tag.destroy_all
#    Menu.destroy_all
#    Article.destroy_all
#
#    # create tags and menus
#    generate_menu_with_tag("Komplettpakete")
#    generate_menu_with_tag("Desktop-PCs")
#    generate_menu_with_tag("Monitore")
#    generate_menu_with_tag("Mainboard-Bundles")
#    generate_menu_with_tag("Mainboards")
#    generate_menu_with_tag("CPUs")
#    generate_menu_with_tag("Arbeitsspeicher")
#
#    # create articles
#    generate_article_with_tags("[SET] DELL PowerEdge T20 Xeon E3-1225v3 Mini-Tower Server with Samsung S22D300H 54,61 cm (22 Zoll) LED-Monitor",
#                               "Der PowerEdge T20 Server überzeugt mit umfangreicher interner Massenspeicherkapazität und starker Leistung. Sein Minitower-Gehäuse ist für einen leisen, effizienten und unterbrechungsfreien Betrieb ausgelegt. Mit dem T20 können Sie die Daten und Anwendungen mehrerer Desktop-PCs und Workstations auf einem einzigen Server konsolidieren und so nicht nur die Zusammenarbeit optimieren, sondern auch Ihre Produktivität steigern.",
#                               379.00,
#                               ["Komplettpakete"])
#    generate_article_with_tags("DELL PowerEdge T20 Xeon E3-1225v3 Mini-Tower Server",
#                               "Der PowerEdge T20 Server überzeugt mit umfangreicher interner Massenspeicherkapazität und starker Leistung. Sein Minitower-Gehäuse ist für einen leisen, effizienten und unterbrechungsfreien Betrieb ausgelegt. Mit dem T20 können Sie die Daten und Anwendungen mehrerer Desktop-PCs und Workstations auf einem einzigen Server konsolidieren und so nicht nur die Zusammenarbeit optimieren, sondern auch Ihre Produktivität steigern.",
#                               299.00,
#                               ["Desktop-PCs"])
#    generate_article_with_tags("Samsung S22D300H 54,61 cm (22 Zoll) LED-Monitor",
#                               "Der neuen Samsung Monitore S22D300H überzeugen durch sein schlichtes, klassisches Design in schwarz-glänzender Klavierlack-Optik. Darüber hinaus verfügt er über einen HDMI- und VGA-Anschluss, sowie praktische Features: MagicUpscale ermöglicht durch einen intelligenten Algorithmus qualitativ hochwertiges Upscaling von Bildinhalten. Ist die Funktion aktiviert, sehen auch Bildinhalte in geringerer Auflösung nahezu so perfekt aus als würden sie in nativer Full-HD-Qualität zur Verfügung stehen. Die Eco Saving-Funktion ermöglicht Energiesparen auf Knopfdruck durch Anpassung der Bildhelligkeit. Selbstredend sind alle Modelle Windows 8 kompatibel.",
#                               99.00,
#                               ["Monitore"])
#    generate_article_with_tags("Acer Aspire XC-605 DT.STEEG.084 PC i7-4790 8GB 1TB SSHD",
#                               "Aufgaben erledigen, Programme ansehen, gelegentlich ein Spiel spielen und mit Freunden in Kontakt bleiben: All dies lässt sich ganz einfach mit einem Intel® Core™-Prozessor bis zur dritten Generation oder einem neuen AMD-Prozessor und Grafikprozessoren bewerkstelligen, die von integrierten Intel® HD-Grafikkarten bis hin zu diskreten NVIDIA® GeForce®- oder AMD Radeon™-Karten reichen.",
#                               499.00,
#                               ["Desktop-PCs"])
#    generate_article_with_tags("Lenovo IdeaCentre H500s 57324437 PC J1750 4GB 500GB",
#                               "Der platzsparende und zuverlässige Lenovo H500s verbindet neueste Prozessortechnologie mit erstklassiger Multimedialeistung und großer Speicherkapazität – und ist so ideal für Heimcomputer-Anwendungen.",
#                               159.00,
#                               ["Desktop-PCs"])
#    generate_article_with_tags("Asus P9D WS Intel® C226",
#                               "Das Asus P9D WS-Mainboard ist mit dem neuen Intel C226-Chipsatz ausgestattet und unterstützt Intel Xeon E3-1200 v3- sowie Core-Prozessoren der vierten Generation. Das Asus P9D WS ist voll ISV-zertifiziert (Independent Software Vendor) und wurde speziell für Workstations sowie High-End-Desktop-PC-Systeme entwickelt und verfügt über eine breite Speicherkompatibilität. Es ist mit dem Asus Dr. Power-Dienstprogramm ausgestattet, welches den Status von Netzteilen überwacht, um plötzlichen Systemausfällen vorzubeugen. Außerdem verfügt es über eine Vielzahl an Schnittstellen inklusive mehrerer Schnittstellen für Monitore.",
#                               0.00,
#                               ["Mainboards"])
#    generate_article_with_tags("Intel Xeon E3-1225 v3",
#                               "Die Intel Xeon Prozessoren zeichnen sich durch neue, innovative Technologien wie die Hyper-Threading-Technologie und die Intel NetBurst Mikroarchitektur aus. Sie bieten hervorragende Leistungs- und Funktionseigenschaften mit genügend Spielraum für aktuelle und kommende Server- und Workstation-Plattformen. Bedeutende Weiterentwicklungen der Plattform, die besonderen Leistungseigenschaften und ein außergewöhnliches Preis-Leistungs-Verhältnis machen es gerade jetzt sinnvoll, von älteren Systemen auf die aktuelle Technologie aufzurüsten und damit Vorteile im Wettbewerb zu erzielen.",
#                               0.00,
#                               ["CPUs"])
#    generate_article_with_tags("Crucial CT2KIT51264BA160B 8GB 4GB 240-pin DDR3 1600mhz non-ECC",
#                               "Crucial 8GB KIT (4GBX2) DDR3 1600 MT/S, 4GB, 240-pin DIMM, DDR3 PC3-12800, 1600MHz, Non-ECC, CL11, 1.5V ",
#                               0.00,
#                               ["Arbeitsspeicher"])
#    generate_article_with_tags("[BUNDLE] Asus P9D WS Intel® C226 with Intel Xeon E3-1225 v3",
#                               "Mainboard / CPU Bundles sind ideal als Grundgerüst für ein individuell gestaltetes PC-System geeignet. Darüber hinaus stellen Sie eine erstklassige Möglichkeit dar, um einem bestehenden PC-System ein Upgrade mit neuer, leistungsstarker Technik zu verschaffen. Unsere Mainboard / CPU Bundles werden mit den Komponenten CPU, passendem Kühler und Mainboard sowie dem notwendigen Zubehör wie Schrauben, Kabel und Bedienungsanleitung ausgeliefert!",
#                               0.00,
#                               ["Mainboard-Bundles"])
#
#    # create structure
#
#    generate_article_structure(
#        "[SET] DELL PowerEdge T20 Xeon E3-1225v3 Mini-Tower Server with Samsung S22D300H 54,61 cm (22 Zoll) LED-Monitor",
#        "DELL PowerEdge T20 Xeon E3-1225v3 Mini-Tower Server",
#        1)
#    generate_article_structure(
#        "[SET] DELL PowerEdge T20 Xeon E3-1225v3 Mini-Tower Server with Samsung S22D300H 54,61 cm (22 Zoll) LED-Monitor",
#        "Samsung S22D300H 54,61 cm (22 Zoll) LED-Monitor",
#        1)
#    generate_article_structure(
#        "DELL PowerEdge T20 Xeon E3-1225v3 Mini-Tower Server",
#        "[BUNDLE] Asus P9D WS Intel® C226 with Intel Xeon E3-1225 v3",
#        1)
#    generate_article_structure(
#        "[BUNDLE] Asus P9D WS Intel® C226 with Intel Xeon E3-1225 v3",
#        "Intel Xeon E3-1225 v3",
#        1)
#    generate_article_structure(
#        "[BUNDLE] Asus P9D WS Intel® C226 with Intel Xeon E3-1225 v3",
#        "Asus P9D WS Intel® C226",
#        1)
#    generate_article_structure(
#        "[BUNDLE] Asus P9D WS Intel® C226 with Intel Xeon E3-1225 v3",
#        "Crucial CT2KIT51264BA160B 8GB 4GB 240-pin DDR3 1600mhz non-ECC",
#        2)
      
    # generate admins
    generate_admins
  end
end
