class TaskManager
  def initialize
    @tasks = []
  end

  def start
    while true
      puts "1. Exibir todas as tarefas\n2. Adicionar Tarefas\n3. Ver Tarefas\n4. Editar Tarefas\n5. Remover Tarefas\n0. Sair"
      action = gets.chomp.to_i

      case action
      when 0
        puts "Até a próxima!"
        break
      when 1
        list_tasks
      when 2
        add_task
      when 3
        show_task
      when 4
        edit_task
      when 5
        remove_task
      else
        puts 'Opção inválida'
      end
    end
  end

  private

  def list_tasks
    if @tasks.empty?
      puts "Você ainda não possui nenhuma tarefa. Gostaria de adicionar uma?"
    else
      puts "____Lista de Tarefas____"
      @tasks.each do |task|
        puts "Tarefa --> #{task[:tarefa]} - Data/Hora --> #{task[:dados]}"
      end
      puts "--------------------------------"
    end
  end

  def add_task
    puts "Qual tarefa gostaria de adicionar?"
    response = gets.chomp
    if response.empty?
      puts "Digite a tarefa para adicionar"
      add_task
    else
      @tasks << { tarefa: response, dados: Time.now.strftime("%Y-%m-%d") }
    end
  end

  def show_task
    puts "Digite o número da tarefa que deseja ver mais detalhes:"
    response = gets.chomp
    found_task = @tasks.find { |task| task[:tarefa] == response }
    if found_task
      puts "Tarefa: #{found_task[:tarefa]} - Data: #{found_task[:dados]}"
    else
      puts "Tarefa não encontrada."
    end
  end

  def edit_task
    print "Digite o nome da tarefa que gostaria de editar: "
    response = gets.chomp
    found_task = @tasks.find { |task| task[:tarefa] == response }
    if found_task
      puts "Digite o novo nome da tarefa:"
      new_name = gets.chomp
      if !new_name.empty?
        found_task[:tarefa] = new_name
      end
    else
      puts "Tarefa não encontrada."
    end
  end

  def remove_task
    print "Digite o nome da tarefa que você quer remover:\n\n"
    response = gets.chomp
    found_task = @tasks.find { |task| task[:tarefa] == response }
    if found_task
      print "Deseja deletar a tarefa #{found_task[:tarefa]}? (S/N): "
      delete_response = gets.chomp.downcase
      if delete_response == "s"
        @tasks.delete(found_task)
        puts "Tarefa removida com sucesso!"
      else
        puts "Operação cancelada."
      end
    else
      puts "Tarefa não encontrada."
    end
  end
end

# Inicializar e executar o gerenciador de tarefas
task_manager = TaskManager.new
task_manager.start
