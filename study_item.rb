class StudyItem 
    attr_reader :id, :title, :category
    @@index = 0
    @@study_items = []

    def initialize(title:, category:)
        @@index += 1

        @id = @@index
        @title = title
        @category = category       
        @@study_items << self
    end

    def include?(query)
        title.downcase.include?(query.downcase) || category.downcase.include?(query.downcase)
    end

    def self.register
        print 'Digite o título do seu item de estudo: '
        title = gets.chomp
        print 'Digite a categoria do seu item de estudo: '
        category = gets.chomp
        puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"    
        new(title: title, category: category)   
    end

    def self.all        
        @@study_items
    end

    def self.search(term) 
        found_items = @@study_items.filter do |item|
            item.include? term
        end
    end

    def self.delete         
        puts '======== LISTA DE ITENS ========'
        puts all
        puts "\nQual o id do Item de estudo você quer apagar?"
        id = gets.to_i  
        study_item = self.all.detect do |item| 
            item.id == id 
        end
        self.all.delete(study_item)
    end

    def to_s 
        "##{id} - #{title} - #{category}"
    end
end