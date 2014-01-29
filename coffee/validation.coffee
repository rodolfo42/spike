define 'validation', (module, exports) ->

    $.validator.addMethod "cepEspecifico", (informado, el, cep) -> informado is cep
    $.validator.format "Coloque o cep {0}"

    form = $ '#frmCotacao'
    form.validate
        onkeyup: false,
        errorClass: 'error'
        errorElement: 'span'
        validClass: 'success'
        rules:
            txtCep:
                required: on
                rangelength: [5,5]
                number: on
                # cepEspecifico: "11040"
            txtPeso:
                required: on
                number: on
                range: [0, 150]
            txtComprimento:
                required: off
                number: on
            txtLargura:
                required: off
                number: on
            txtAltura:
                required: off
                number: on
                
        messages:
            txtCep: 
                required: "CEP inválido"
                rangelength: "CEP inválido"
                number: "CEP inválido"
                cepEspecifico: $.validator.format "Precisa ser o CEP {0}"
            txtPeso: 
                required: "Peso é obrigatório"
                number: "Peso precisa ser numérico"
                range: "Peso precisa ser entre 0,1 e 150 kg"
            txtComprimento: "Medida inválida"
            txtLargura: "Medida inválida"
            txtAltura: "Medida inválida"
        success: $.noop
        errorPlacement: (error, element) ->
            elem = $ element
            
            if not error.is ':empty'
                elem.qtip
                    overwrite: false
                    content: error.text()
                    show:
                        event: off
                        ready: on
                    hide: off
                    position:
                        my: 'bottom left'
                        at: 'top right'
                    style:
                        classes: 'qtip-red qtip-rounded'
                
                elem.qtip 'option', 'content.text', error.text()
            else
                elem.qtip 'destroy'