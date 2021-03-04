require_relative 'study_item'
require 'colorize'

String.disable_colorization false   # enable colorization

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
    'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'.colorize(:yellow).on_light_blue
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
    puts 'Nenhum item encontrado'.colorize(:red)   if StudyItem.all.empty?    
end

def search_items
    print 'Digite uma palavra para procurar: '
    term = gets.chomp    
    items = StudyItem.search(term)
    if items.empty? 
        puts 'Nenhum item encontrado'.colorize(:red)
    else
        puts items
    end
end

def delete_items
    if StudyItem.delete != nil
        puts 'Item deletado'
    else
        puts 'Item não cadastrado'.colorize(:red)
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
        puts 'Obrigado por usar o Diário de Estudos'.colorize(:yellow)  
        wait_keypress_clear
        break
    else
        puts 'Opção inválida'.colorize(:red)
    end   
    wait_keypress_clear
puts welcome
option = menu
end