jQuery.extend(jQuery.validator.messages, {
    required: 'Este campo es requerido',
    equalTo: 'Las contrasenas no coinciden',
    email: 'Correo invalido',
});

jQuery.validator.addMethod('isUniqueEmail', function(value, element) {
	var AUTH_TOKEN = $('input[name=authenticity_token]').val();
	var email_val = $('#usuario_email').val();
    $.post('/checkEmail', {email: email_val, authenticity_token: AUTH_TOKEN}, function(data) {
    	return data;
    })
});

jQuery.validator.addMethod('isUniqueRFC', function(value, element) {
	var AUTH_TOKEN = $('input[name=authenticity_token]').val();
	var email_val = $('#usuario_email').val();
    $.post('/checkRFC', {RFC: value, authenticity_token: AUTH_TOKEN}, function(data) {
    	return data;
    })
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

$('#register-form').validate({
	errorClass: 'is-danger',
	errorPlacement: function(label, element) {
        label.addClass('help has-text-danger');
        label.insertAfter(element);
    },
	rules: {
		'usuario[nombres]': 'required',
		'usuario[apellidos]': 'required',
		'usuario[email]': {
			required: true,
			email: true,
			isUniqueEmail: true,
		},
		'usuario[empresa]': 'required',
		'usuario[RFC]': {
			required: true,
			minlength: 13,
			maxlength: 14,
			isUniqueRFC: true
		},
		'usuario[password]': 'required',
		'usuario[password_confirmation]': {
			required: true,
			equalTo: '#usuario_password'
		}
	},
	messages: {
		'usuario[email]': {
			isUniqueEmail: 'Email ya esta registrado'
		},
		'usuario[RFC]': {
			minlength: 'RFC invalido',
			maxlength: 'RFC invalido',
			isUniqueRFC: 'RFC ya esta registrado'
		}
	}
});
/*
$("#register-form").on('keyup', function() {
	var AUTH_TOKEN = $('input[name=authenticity_token]').val();
	var email_val = $('#usuario_email').val();
	console.log(AUTH_TOKEN)
    $.post('/checkEmail', {email: email_val, authenticity_token: AUTH_TOKEN}, function(data) {
    	console.log(data)
    })
});*/