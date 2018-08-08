#Se pide:
    #Optimizar el código implementando el operador splat al momento de instanciar los productos
    #Generar un método que permita calcular el promedio de precio por producto.

    class Product
      def initialize(name, *sizes)
        @name = name
        @large = sizes[0].to_i
        @medium = sizes[1].to_i
        @small = sizes[2].to_i
        @xsmall = sizes[3].to_i

        print "#{@name} - #{@large} - #{@medium} - #{@small} - #{@xsmall}\n"
      end
      def average
        (@large + @medium + @small + @xsmall) / 4
      end
    end

    products_list = []
    data = []
    File.open('catalogo.txt', 'r') { |file| data = file.readlines}
    data.each do |prod|
      ls = prod.split(', ')
      products_list << Product.new(*ls)
    end

    print "#{products_list}\n"
    print "Promedio de precio: #{products_list[0].average}\n"
