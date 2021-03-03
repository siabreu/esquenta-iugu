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

    # def self.print

    # end

    def to_s 
        "##{id} - #{title} - #{category}"
    end
end