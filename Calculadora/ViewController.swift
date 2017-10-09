//
//  ViewController.swift
//  Calculadora
//
//  Created by Jesus Martínez de Juan on 26/9/17.
//  Copyright © 2017 Jesus Martínez de Juan. All rights reserved.
//

import UIKit
import Darwin
class ViewController: UIViewController {
    @IBOutlet weak var pantalla: UILabel!
    @IBOutlet var miniPantalla: UILabel!
    var ans : Double = 0;
    var elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero : Bool = false
    var op1: Double = 0
    var op2: Double = 0
    var operacion: String = ""
    
    
   
    func realizaOperacion()-> Double{
        var resultado: Double = 0
        switch operacion {
        case "+":
            resultado=op1+op2;
        case "-":
            resultado=op1-op2;
        case "*":
            resultado=op1*op2;
        case "/":
            resultado=op1/op2;
        case "^":
            resultado=pow(op1,op2)
        case "√":
            resultado = pow(op1,(1/op2))
        default:
            resultado=999
        }
        return resultado
    }
    
    
    @IBAction func numeroPulsado(_ sender: UIButton) {
        let digito : String! = sender.currentTitle
        
        if elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero{
            switch digito {
            case "e":
                pantalla.text = "e"
            case "π":
                pantalla.text = "π"
            default:
                pantalla.text = pantalla.text! + digito
            }
        }else{
            pantalla.text = digito
            elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero = true
        }
        
        print(digito)
        
    }
   
    @IBAction func operacionPulsada(_ sender: UIButton) {
        var numero: NSString = pantalla.text! as NSString
        if numero == "e"{
            op1=M_E
        }else{if numero == "π"{
            op1=Double.pi
        }else {op1 = numero.doubleValue}
                }
        operacion = sender.currentTitle!
        miniPantalla.text = pantalla.text
        pantalla.text = "0"
        elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero = false
    }
    @IBAction func enterPulsado() {
        var numero: NSString = pantalla.text! as NSString
        if numero == "e"{
            op2=M_E
        }else{if numero == "π"{
            op2=Double.pi
        }else {op2 = numero.doubleValue}
        }
        var resultado: Double = realizaOperacion()
        pantalla.text = String (format: "%g", resultado)
        ans = resultado
        op1=0
        elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero=false
    }
    @IBAction func cPulsado(_ sender: UIButton) {
        op1 = 0;
        op2 = 0;
        miniPantalla.text="0"
        pantalla.text="0"
    }
   
    @IBAction func ansPulsado(_ sender: UIButton) {
        pantalla.text = String (format : "%g", ans)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

