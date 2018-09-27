







//reusable dialog
function customDialogMessageFrame(message,dialogtitle)
{
	
	document.getElementById("cdialog").title=dialogtitle;

	
	mainDialog=$( "#cdialog" ).dialog({
			  modal: true,
                          width: "auto",
			  open: function() {
				  $(".ui-dialog-titlebar-close").hide();
		          $(this).html(message);
		        },
			  buttons : [{text:"ok",click: function() { $(this).dialog('close');
			 
			  }}]
		}); 
		
}	

//verify login
function verifyLogin()
{  
if($("#uname").val()=="" || $("#pwd").val()=="" )
{
//alert("please enter username and password");
customDialogMessageFrame("please enter username and password","Notice");
return false;
}
}



//this function is to add faculty details
function addFaculty()
{
var isFacultyEmpty=false;

//verify all the faculty values are entered are not
	 $(".faculty-input").each(function() {
		 if($(this).val()=="")
		 {
		customDialogMessageFrame("can you please enter all the faculty names please","Notice");
		isFacultyEmpty=true;
		return false;
		 }
		})	
		
		
if(isFacultyEmpty)
	return false;
	
	
//trigger ajax	 for adding faculty
$.ajax({
	type:"POST",
	url:"faculty",
	data:$('#facultyform').serialize(),
	success:function(response)
	{
		if(response=="success")
		customDialogMessageFrame("Faculty Details Added Scussfully","Notice");
		else
	    customDialogMessageFrame("Faculty with same name not allowed","Notice");	
		$(".faculty-input").val("");
	},
	error:function(e)
	{
		console.log("inside the ajax error");
	}
});
}

//used to get faculty in the  subjects page
function  getFaculty()
{
	var $options = $("#original-faculty > option").clone();

	$('.faculty-select').append($options);	
}


//on selection extra subject
function addFacultyToExtra()
{
	var $options = $("#original-faculty > option").clone();

	$('.faculty-opt').append($options);
}
//this method is used to add subjects and also faculty for thet subject

function addSubjects()
{
var isSubjectEmpty=false;

//verify all the faculty values are entered are not
	 $(".subject-input").each(function() {
		 if($(this).val()=="")
		 {
		customDialogMessageFrame("can you please enter all the manditory(*) subject names please","Notice");
		isSubjectEmpty=true;
		return false;
		 }
		})	
		
	if(isSubjectEmpty)
	return false;
	 
		 $(".faculty-select").each(function() {
		 if($(this).val()=="-1")
		 {
		customDialogMessageFrame("can you please enter all the manditory(*) faculty names please","Notice");
		isSubjectEmpty=true;
		return false;
		 }
		})	
		
		
if(isSubjectEmpty)
	return false;
	
	
//trigger ajax	 for adding faculty to adding subjects
$.ajax({
	type:"POST",
	url:"subject",
	data:$('#subjectform').serialize(),
	success:function(response)
	{
		if(response=="success")
			{
			customDialogMessageFrame("Subject Details Added Scussfully","Notice");
			}
			else
		    customDialogMessageFrame("Subject with same name not allowed","Notice");
		$(".subject-input").val("");
		$('input[type=checkbox]').prop('checked', false) 
	},
	error:function(e)
	{
		console.log("inside the ajax error");
	}
});
}


//this method is used to get faculty details for that subjectin timetablePage
function getFacultyNames()
{

	$.ajax({
		type:"POST",
		url:"getSubjectFaculty",
		data:$('#timetableForm').serialize(),
		success:function(response)
		{
			facultSubjectnames=JSON.parse(response);
			if(facultSubjectnames.length==0)
				{
				$("#faculty-body").empty();
				
				customDialogMessageFrame("No Records Exists in the table","Notice");
				$( '.faculty-table' ).hide()
				}
			else
				{
				$( '.faculty-table' ).show();
				displayFacultyTable();
			
				}
			//alert(response);
		},
		error:function(e)
		{
			console.log("inside the ajax error");
		}
		
	});
}




function displayFacultyTable()
{
	$("#faculty-body").empty();
	for(i=0;i<facultSubjectnames.length;i++)
	{
	var subjectName=facultSubjectnames[i].subjectName;
	var facultyName=facultSubjectnames[i].facultyName;
	var table = document.getElementById('faculty-body');
  	//document.getElementById("subject-faculty-table").style.display="block";
	var newRow   = table.insertRow(table.rows.length);
  	var newCellSN  = newRow.insertCell(0);
  	//var newCellEX  = newRow.insertCell(1);
  	var newCellFN = newRow.insertCell(1);
  	// Append a text node to the cell
  	newCellSN.appendChild(document.createTextNode(subjectName));
 // Append a text node to the cell
  	newCellFN.appendChild(document.createTextNode(facultyName));
  	
	}
}



//Ajax for getting initial course for particular period
function onTimeTableLoad()
{ 


    $.ajax({
    	type:"POST",
    	url:"selectedSubjects", 
    	data:{
    		semYear:$("#sem-year").val(),
    		semBranch:$("#sem-branch").val()
    	},
    	success:function(response)
    	{ 
    		console.log("==Response="+response);
    		var result=JSON.parse(response);
    		for(i=0;i<result.length;i++)
    		{
    			var selectId=result[i].id;
    			var subjectName=result[i].subjectName; 
    			console.log("id here"+subjectName+selectId); 
    			$('#'+selectId+' option:contains('+subjectName+')').prop('selected', true);
    		}
    	},
    	error:function(e)
    	{
    		console.log("inside the ajax error");
    	}
    	
    });

}








//Add the timetable details
function addTimeTable()
{
	console.log(selectedSubjectId+selectedSubjectName);
	
	  $.ajax({
	    	type:"POST",
	    	url:"addSubjectsTimetable",
	    	data:{
	    		SubjectId:selectedSubjectId,
	    		SubjectName:selectedSubjectName,
	    		semYear:$("#sem-year").val(),
	    		semBranch:$("#sem-branch").val()
	    		
	    	},
	    	success:function(response)
	    	{
	    		var responseSubject=JSON.parse(response);
	    		var subjectName=responseSubject.subjectName;
	    		var subjectflag=responseSubject.subjectflag;
	    		if(subjectflag=="failure" && subjectName!="")
	    			{
	    			customDialogMessageFrame("Sorry Faculty is Not available","Notice");
	    			$('#'+selectedSubjectId+' option:contains('+subjectName+')').prop('selected', true)
	    			} 
	    		else if(subjectflag=="success")
	    			{
	    			customDialogMessageFrame("Entry Added successfully","Notice");
	    			}
	    		console.log("Response in subjects="+response);
	    	}, 
	    	error:function(e)
	    	{
	    		console.log("inside the ajax error");
	    	}
	    	
	    });
}



//AJax for getting only subject list for the selected branch and sem
function getSubjectNames()
{

	$.ajax({
		type:"POST",
		url:"getSubjectFaculty",
		data:$('#timetableForm').serialize(),
		success:function(response)
		{
			facultSubjectnames=JSON.parse(response);
			if(facultSubjectnames.length==0)
				{
				//customDialogMessageFrame("There are no subjects Yet for the selected branch and sem","Notice");
				$('.select-cources').empty();
				$('.select-cources').append($('<option>', {
				    value: "-1",
				    text: 'Select Cource'
				}));
				
				}
			else
				{
				$('.select-cources').empty();
				$('.select-cources').append($('<option>', {
				    value: "-1",
				    text: 'Select Cource'
				}));
				for(i=0;i<facultSubjectnames.length;i++)
				{
			    var subjectName=facultSubjectnames[i].subjectName;
				$('.select-cources').append($('<option>', {
				    value: subjectName,
				    text: subjectName
				}));
				}
				}
			//alert(response);
		},
		error:function(e)
		{
			console.log("inside the ajax error");
		}
		
	});
}





//Get initial Subject information
function isSubjectsPresent()
{
	//trigger ajax	 for adding faculty to adding subjects
	$.ajax({
		type:"POST",
		url:"verifySubjects",
		data:$('#subjectform').serialize(),
		success:function(response)
		{
			if(response=="yes")
				{
				$("#message").html("Note: The subjectes are already added to the slected brach and sem.<br/>If you add again then you need to add subjects again in timetable")
				}
			else
				$("#message").html("");
				
		},
		error:function(e)
		{
			console.log("inside the ajax error");
		}
	});
}




