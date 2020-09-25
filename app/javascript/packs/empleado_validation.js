jQuery.extend(jQuery.validator.messages, {
    required: "Este campo es requerido",
    digits: 'Este campo solo acepta numeros'
});

$('form').validate({
	errorClass: 'is-danger',
	errorPlacement: function(label, element) {
        label.addClass('help has-text-danger');
        label.insertAfter(element);
    },
	rules: {
		'empleado[nombres]': 'required',
		'empleado[sucursal_id]': 'required',
		'empleado[RFC]': {
			required: true,
			minlength: 13,
			maxlength: 14
		},
	},
	messages: {
		'empleado[RFC]': {
			minlength: 'RFC invalido',
			maxlength: 'RFC invalido'
		}
	}
});