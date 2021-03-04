require_relative 'study_item'

REGISTER = 1
VIEW = 2
SEARCH = 3
DELETE = 4
EXIT = 5

def clear
    system('clear')
end

def wait_keypress
    puts
    puts 'Pressione enter para continuar'
    gets    
end

def wait_keypress_clear
    wait_keypress
    clear
end

def welcome
    'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
end
  
def menu    
    puts "[#{REGISTER}] Cadastrar um item para estudar"
    puts "[#{VIEW}] Ver todos os itens cadastrados"
    puts "[#{SEARCH}] Buscar um item de estudo"
    puts "[#{DELETE}] Deletar um item de estudo"
    puts "[#{EXIT}] Sair"
    print 'Escolha uma opção: '
    gets.to_i
end

def print_items
    puts StudyItem.all
    puts 'Nenhum item encontrado' if StudyItem.all.empty?    
end

def search_items
    print 'Digite uma palavra para procurar: '
    term = gets.chomp    
    items = StudyItem.search(term)
    if items.empty? 
        puts 'Nenhum item encontrado'
    else
        puts items
    end
end

def delete_items
    if StudyItem.delete != nil
        puts 'Item deletado'
    else
        puts 'Item não cadastrado'
    end    
end

clear
puts welcome
option = menu

loop do
    clear
    case option
    when REGISTER
        StudyItem.register
    when VIEW
        print_items
    when SEARCH
        search_items
    when DELETE
        delete_items
    when EXIT        
        puts 'Obrigado por usar o Diário de Estudos'  
        wait_keypress_clear
        break
    else
        puts 'Opção inválida'
    end   
    wait_keypress_clear
option = menu
end