jQuery.extend(jQuery.validator.messages, {
    required: 'Este campo es requerido',
    digits: 'Este campo solo acepta numeros'
});

$('form').validate({
	errorClass: 'is-danger',
	errorPlacement: function(label, element) {
        label.addClass('help has-text-danger');
        label.insertAfter(element);
    },
	rules: {
		'sucursal[nombre]': {
			required: true,
			remote: '/checkNombreSucursal'
		},
		'sucursal[numero_exterior]': 'digits',
		'sucursal[numero_interior]': 'digits',
		'sucursal[codigo_postal]': {
			digits:true, 
			minlength: 5,
			maxlength: 5
		}
	},
	messages: {
		'sucursal[nombre]': {
			remote: 'Nombre de sucursal ya esta registrado'
		},
		'sucursal[codigo_postal]': {
			minlength: 'Codigo postal invalido',
			maxlength: 'Codigo postal invalido'
		}
	}
});