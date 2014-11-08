# coding: UTF-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
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
    # reset everything
    Tag.destroy_all
    Menu.destroy_all
    Article.destroy_all
    
    # create tags and menus
    generate_menu_with_tag("Komplettpakete")
    generate_menu_with_tag("Desktop-PCs")
    generate_menu_with_tag("Mainboard Bundles")
    generate_menu_with_tag("Mainboards")
    generate_menu_with_tag("CPUs")
    
    # create articles
    generate_article_with_tags("DELL PowerEdge T20 Xeon E3-1225v3 Mini-Tower Server",
      "Der PowerEdge T20 Server überzeugt mit umfangreicher interner Massenspeicherkapazität und starker Leistung. Sein Minitower-Gehäuse ist für einen leisen, effizienten und unterbrechungsfreien Betrieb ausgelegt. Mit dem T20 können Sie die Daten und Anwendungen mehrerer Desktop-PCs und Workstations auf einem einzigen Server konsolidieren und so nicht nur die Zusammenarbeit optimieren, sondern auch Ihre Produktivität steigern.",
      299.00,
      ["Desktop-PCs"])
    generate_article_with_tags("Acer Aspire XC-605 DT.STEEG.084 PC i7-4790 8GB 1TB SSHD",
      "Aufgaben erledigen, Programme ansehen, gelegentlich ein Spiel spielen und mit Freunden in Kontakt bleiben: All dies lässt sich ganz einfach mit einem Intel® Core™-Prozessor bis zur dritten Generation oder einem neuen AMD-Prozessor und Grafikprozessoren bewerkstelligen, die von integrierten Intel® HD-Grafikkarten bis hin zu diskreten NVIDIA® GeForce®- oder AMD Radeon™-Karten reichen.",
      499.00,
      ["Desktop-PCs"])
    generate_article_with_tags("Lenovo IdeaCentre H500s 57324437 PC J1750 4GB 500GB",
      "Der platzsparende und zuverlässige Lenovo H500s verbindet neueste Prozessortechnologie mit erstklassiger Multimedialeistung und großer Speicherkapazität – und ist so ideal für Heimcomputer-Anwendungen.",
      159.00,
      ["Desktop-PCs"])
    
    # create structure
    generate_article_structure(
      "Lenovo IdeaCentre H500s 57324437 PC J1750 4GB 500GB",
      "Acer Aspire XC-605 DT.STEEG.084 PC i7-4790 8GB 1TB SSHD",
      3)
    generate_article_structure(
      "Acer Aspire XC-605 DT.STEEG.084 PC i7-4790 8GB 1TB SSHD",
      "DELL PowerEdge T20 Xeon E3-1225v3 Mini-Tower Server",
      3)

    render text: "Generated database entries!"
  end
end
