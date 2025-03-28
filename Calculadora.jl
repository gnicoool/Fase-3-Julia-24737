#Jackelyn Nicolle Girón Villacinda 
#Carné 24737
#Fase 3 


function pedir_numero(msg)
    while true
        print(msg)
        try
            return parse(Float64, readline())
        catch
            println("Invalida, ingrese un  nuemro")
        end
    end
end

function calculadora()
    while true
        println("\n----- Calculadora -----")
        println("1. Suma")
        println("2. Resta")
        println("3. Multiplicación")
        println("4. División")
        println("5. Raíz cuadrada")
        println("6. Potencia")
        println("7. Logaritmo base 10")
        println("8. Logaritmo natural")
        println("9. Trigonometría (sen/cos/tan)")
        println("10. Salir")

        opcion = try
            pedir_numero("Ingrese la opcion que desea: ") |> Int
        catch
            println("Opción no válida, ingrese una opcion entre 1 y 10")
            continue
        end

        if opcion == 10
            println("Saliendo del programa")
            break
        end

        if opcion in 1:4 || opcion == 6
            a = pedir_numero("Ingrese 1er número: ")
            b = opcion != 6 ? pedir_numero("Ingrese 2do número: ") : 
                             pedir_numero("Ingrese exponente: ")

            resultado = if opcion == 1
                a + b
            elseif opcion == 2
                a - b
            elseif opcion == 3
                a * b
            elseif opcion == 4
                b == 0 ? "Error: División por cero" : a / b
            elseif opcion == 6
                a^b
            end

        elseif opcion == 5 || opcion in 7:8
            x = pedir_numero("Ingrese el número: ")
            resultado = if opcion == 5
                x < 0 ? "Error: Raiz de numero negativo" : √x
            elseif opcion == 7
                x <= 0 ? "Error: Logaritmo de numero no positivo" : log10(x)
            elseif opcion == 8
                x <= 0 ? "Error: Logaritmo de numero no positivo" : log(x)
            end

        elseif opcion == 9
            println("\n----- Funciones trigonometricas -----")
            println("1. Seno")
            println("2. Coseno")
            println("3. Tangente")
            sub_op = try
                pedir_numero("Ingrese la opcion que desea ") |> Int
            catch
                println("No valido, ingrese  una opcion entre 1 y 3")
                continue
            end

            grados = pedir_numero("Ingrese angulo en grados: ")
            rad = deg2rad(grados)
            resultado = if sub_op == 1
                sin(rad)
            elseif sub_op == 2
                cos(rad)
            elseif sub_op == 3
                tan(rad)
            else
                "Opción no válida"
            end

        else
            println("Opcion no reconocida.")
            continue
        end

        println("\nResultado: ", resultado)
    end
end

calculadora()