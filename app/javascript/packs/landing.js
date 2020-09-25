$.ajax({
    method: 'GET',
    url:'signup/',
    dataType: 'json',
    success: function() {
      console.log('JSON:', arguments[0]);
    },
    error: function() {
      console.log('Fail');
    }
  });
