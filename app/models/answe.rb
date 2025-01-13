class Answe < ApplicationRecord
  belongs_to :question
  belongs_to :survey

  def self.to_csv
    answers = all

    CSV.generate do |csv|
      #Encabezados
      csv << %w[Section Question Answer User]

      answers.each do |answer|

        #Fila del Csv. Nota: csv << es para pasar a la siguiente fila
        csv << [
          answer.question.section.name,
          answer.question.name,
          if  answer.question.text_free?
            answer.name
          else
            Option.find(answer.name).name.to_plain_text
          end,
          answer.user_token
        ]
      end

    end
  end


  def self.to_xlsx
    answers = all

    #Creo el archivo que se guardara en el repo
    workbook = FastExcel.open("respuesa.xlsx", constant_memory: true)
    
    #Asigno nombre a la hoja de excel
    worksheet = workbook.add_worksheet("datos")
    
    #inserto el encabezado. Nota append_row inserta un fila entera
    bold = workbook.bold_format
    worksheet.append_row(answers.first.attributes.keys, bold) 
    
    #De cada respuesta inserto los datos en fila
    answers.each do |answer|
      worksheet.append_row(answer.attributes.values)
    end



    #una vez que termine de insertar la filas en el excel. Cerramos
    workbook.close
  end

end
