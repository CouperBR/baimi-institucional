$('#cpf').mask('000.000.000-00');
$('#telefone').mask('(00)00000-0000');
$('#telefoneIndicacao').mask('(00)00000-0000');


// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

$("#contact-form").submit(function (event) {
    if (!ValidateForm()) {
        $.ajax('/Contato/Contactar',
            {
                dataType: 'json', // type of response data
                data: $('#contact-form').serialize(),
                method: 'POST',
                success: function (data, status, xhr) {   // success callback function
                    iziToast.destroy();
                    iziToast.success({
                        title: 'Obrigado',
                        message: "Mensagem enviada com sucesso!!",
                        position: 'topCenter'
                    });
                    $(this).closest('form').find("input[type=text], textarea").val("");
                },
                error: function (jqXhr, textStatus, errorMessage) { // error callback 
                    iziToast.destroy();
                    iziToast.show({
                        title: 'Hey',
                        message: "Ocorreu um erro ao enviar sua mensagem. Tente novamente mais tarde.",
                        position: 'topCenter'
                    });
                },
                beforeSend: function () {
                    iziToast.info({
                        title: 'Aguarde',
                        message: 'Estamos enviado sua mensagem!',
                        position: 'topCenter',
                        timeout: 10000
                    });
                }
            });

        event.preventDefault();
    }
});

function ValidateForm() {

    var formInvalid = false;
    $('#contact-form input').each(function () {
        if ($(this).val() === '') {
            formInvalid = true;
        }
    });

    $('#contact-form textarea').each(function () {
        if ($(this).val() === '') {
            formInvalid = true;
        }
    });

    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (!re.test(String($('#email').val()).toLowerCase())){
        formInvalid = true;
    }
    
    return formInvalid;
}


//Simular pagamento
$("#simular-pagamento").click(function () {
    if ($('#valor-avista').val()) {
        let precoProdutoAvista = parseFloat($('#precoProdutoAvista').val());
        let valorDadoAvista = parseFloat($('#valor-avista').val());
        let percenturalAVista = Number($('#percentualAVista').val());

        let Z = precoProdutoAvista - valorDadoAvista;
        let ABC = Z / (1 - (percenturalAVista + 0.01));
        if (ABC < 0) {
            return;
        }
        $('#simulacao').val('R$ ' + ABC.toFixed(2));
    }

    return;
});

$("#fechar-simulacao").click(function () {
    $('#simulacao').val('');
});

$(document).ready(function () {
    var paginas = {
        menuinicio: '#sect1',
        menuempresa: '#sect2',
        menuprodutos: '#sect3',
        menunoticias: '#sect4'
    }
    $(".active li").click(function (event) {
        $('[id^="sect"]').hide('slow');
        $(paginas[this.id] || '#sect5').show('slow');
    });

    $(".item-about-us").on("click", function (event) {
        console.log();
        $('#div-nossahistoria').addClass('d-none');
        $('#div-nossosclientes').addClass('d-none');
        $('#div-nossospropositos').addClass('d-none');
        $('#div-nossoslemas').addClass('d-none');
        switch ($(this).text()) {
            case 'NOSSA HISTÓRIA':
                $('#div-nossahistoria').removeClass('d-none');
                break;
            case 'NOSSOS CLIENTES':
                $('#div-nossosclientes').removeClass('d-none');
                break;
            case 'NOSSOS PROPÓSITOS':
                $('#div-nossospropositos').removeClass('d-none');
                break;
            case 'NOSSOS LEMAS':
                $('#div-nossoslemas').removeClass('d-none');
                break;
            default:
                $('#div-nossahistoria').removeClass('d-none');
                break;
        }
    });

});


