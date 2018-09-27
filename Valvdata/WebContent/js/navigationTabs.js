//$('li[data-content="first"').css({'background-color':'lightgrey'});    //This line keeps the first tab highlighted when the page is being loded 

$(document).ready(function() {
//alert("ne11w");
$('li[data-content="first"').css({'background-color':'#f8f8f8','margin-bottom' : '-2px'}); //This line keeps the first tab highlighted when the page is being loded 



$('li').on('click', function(e) {

    //////first few lines control the change of color of the selected tab///////

    //removing the previous selected menu state
   // $('li').css({'background-color':'#f8f8f8'});

     //is this element from the second level menu?
    if($(this).closest('ul').hasClass('dropdown')){
      //   $(this).parents('li').css({'background-color':'#f8f8f8' ,'margin-bottom' : '-2px'});
    	$(this).closest('ul').closest('li').css( "background-color",'#f8f8f8');
    		console.log("here");
    		//$(this).css( "background-color",'#f8f8f8');
    	console.log($(this).closest('ul').closest('li').html());
    		
    //this is a parent element
    }else{
    	console.log(" not here");
         $(this).css({'background-color':'#f8f8f8' ,'margin-bottom' : '-2px'});
    }

    /////////////code for controlling change of color of selected tab ends here ///////
    ///////////////////////////////////////////////////////////////////////////////////

    if ($(this).hasClass('submenu-container')) { //prevents any action when any of the top level menus having submenus is clicked
        e.preventDefault();
        return false;
    }

    if ($(this).parents().find('li').hasClass('submenu-container')){ //selects appropriate div element having content 
                                                                     //relevant to the menu selected    

        var data_content = $(this).attr('data-content');

            $('div').each(function(){
                    if($(this).attr('id') == data_content) {
                        $(this).addClass('selected');
                        }
                    else 
                        {
                        $(this).removeClass('selected');
                        $(this).addClass('hidden');
                    }

                });

            e.preventDefault();
            return false;
        }

}); //End $('li').on('click')

}); //End $(document).ready()