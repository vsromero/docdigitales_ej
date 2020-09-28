jQuery.extend(jQuery.validator.messages, {
    required: 'Este campo es requerido',
    equalTo: 'Las contraseñas no coinciden',
    email: 'Correo invalido',
});

$('#login-form').validate({
	errorClass: 'is-danger',
	errorPlacement: function(label, element) {
        label.addClass('help has-text-danger');
        label.insertAfter(element);
    },
	rules: {
		email: {
			required: true,
			email: true,
		},
		password: 'required'
	},
});