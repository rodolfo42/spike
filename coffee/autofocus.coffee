$ ->
    $(document).delegate 'input[onfill]', 'keypress', (e) ->
        if !e.isDefaultPrevented()
            maxLength = parseInt $(this).attr 'maxlength'
            selectedText = $(this).caret().text
            
            if maxLength? and $(this).val().length + 1 is maxLength and e.charCode != 0 and !selectedText.length
                target = $(this).attr "onfill"
                t = $ "##{target}"
                setTimeout -> 
                    t.focus().select()
                , 1