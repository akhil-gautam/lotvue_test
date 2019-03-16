$(document).ready(() => {

  $(document).on('click', 'button#update-roles', () => {

    var checkedRoleIds = [];
    $.each($("input[type='checkbox']:checked"), function(){            
      checkedRoleIds.push($(this).val());
    });

    $.ajax({
      url: '/roles/hide',
      type: "POST",
      data: { checked_role_ids: checkedRoleIds },
      dataType: "json",
      success: function (data) {
              if(data.success){
                $('#info-message').html('Hidden successfully!');
                setTimeout(function(){ $('#info-message').html('');}, 2000);
              }
      },
      failure: function () {
        $('#info-message').html('An error occured while hiding!');
      }
    });
  })
})