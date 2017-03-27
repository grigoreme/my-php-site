var options="";

$(document).ready(function(){
    //Handles menu drop down
    $('.dropdown-menu').find('form').click(function (e) {
        e.stopPropagation();
    });
});

$('#search').keyup(function(e){
    if(e.keyCode == 13)
    {
        goToUrl(updateURLParameter(window.location.href,'page','search'),'search',document.getElementById('search').value);
    }
    e.preventDefault();
});

function findGetParameter(parameterName) {
    var result = null,
        tmp = [];
    location.search
    .substr(1)
        .split("&")
        .forEach(function (item) {
        tmp = item.split("=");
        if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
    });
    return result;
}

$('#filters').on('change', 'input', function(e) {

   var filters = $(e.delegateTarget).find(':checkbox:checked').map(function(v, i) {
     return  $(i).closest("div").prop("id") + "==>" + $(i).attr('value');
   }).get(); // parse all checked checkbox and return parent div id ==> checkbox value

   string = "sort=" +  findGetParameter("sort") +"&type="+ findGetParameter("type")+"&filter="+filters;
   $.ajax({
     type: "GET",
     url: "php/addFilter.php",
     data: string,
     success: function(data, textStatus) {
       $("#items").html(data);
     },
     error:function(exception){alert('Exeption:'+exception);}
   });
});

function post(path, params, method) {
    method = method || "post"; // Set method to post by default if not specified.

    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for(var key in params) {
        if(params.hasOwnProperty(key)) {
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);

            form.appendChild(hiddenField);
         }
    }

    document.body.appendChild(form);
    form.submit();
}

function goToUrl(url, param, paramVal){
	window.location.href=updateURLParameter(url, param, paramVal);
}

function goToUrlDiv(url, param, paramVal,div){
	new_url=updateURLParameter(url, param, paramVal);
	refresh_div(new_url,div);
}

function updateURLParameter(url, param, paramVal)
{

      //mychanges
      if(url.includes("#")){
        url=url.substring(0, url.length - 1);
      }

    var TheAnchor = null;
    var newAdditionalURL = "";
    var tempArray = url.split("?");
    var baseURL = tempArray[0];
    var additionalURL = tempArray[1];
    var temp = "";

    if (additionalURL)
    {
        var tmpAnchor = additionalURL.split("#");
        var TheParams = tmpAnchor[0];
            TheAnchor = tmpAnchor[1];
        if(TheAnchor)
            additionalURL = TheParams;

        tempArray = additionalURL.split("&");

        for (i=0; i<tempArray.length; i++)
        {
            if(tempArray[i].split('=')[0] != param)
            {
                newAdditionalURL += temp + tempArray[i];
                temp = "&";
            }
        }
    }
    else
    {
        var tmpAnchor = baseURL.split("#");
        var TheParams = tmpAnchor[0];
            TheAnchor  = tmpAnchor[1];

        if(TheParams)
            baseURL = TheParams;
    }

    if(TheAnchor)
        paramVal += TheAnchor;

    var rows_txt = temp + "" + param + "=" + paramVal;
    return baseURL + "?" + newAdditionalURL + rows_txt;
}

function check_input_count(){
	var count = $('[id^=input_]').length;
	var array = new Array();
	for(i=1;i<=count;i++){
		if(document.getElementById('input_'+i).value!=null && document.getElementById('input_'+i).value.length>0 && document.getElementById('input_'+i).name.length>0){
			type=document.getElementById('input_'+i).name.substring(0,document.getElementById('input_'+i).name.indexOf("("));
			size=document.getElementById('input_'+i).name.substring(document.getElementById('input_'+i).name.indexOf("(")+1,document.getElementById('input_'+i).name.indexOf(")"));
			val=document.getElementById('input_'+i).value;
			array.push(val);
		}
		else{
			alert("Completati campurile corect va rog!");
			return ;
		}
	}
	return array;
}


function add_element(cat, table){
	event.preventDefault();
	var to_add = check_input_count();
	if(to_add!=null) {
		var string = "&";
		for(i=0;i<to_add.length;i++){
			string+="arg"+i+"="+to_add[i]+"&";
		}
		string = "cat="+cat+"&table="+table+string.substring(0, string.length - 1);
		$.ajax({
			type: "GET",
			url: "php/add_new.php",
			data: string,
			success: function(data, textStatus) {
				$("#result").html(data);
			},
			error:function(exception){alert('Exeption:'+exception);}
		});
		string = window.location.href;
		$.ajax({
			type: "GET",
			url: string,
			success: function(data, textStatus) {
				$("#dbmanage").html(data);
			},
			error:function(exception){alert('Exeption:'+exception);}
		});
	}
}

function processAjaxData(urlPath){
	window.history.replaceState( {} , urlPath, updateURLParameter(urlPath, "ajax", "1") );
	//window.history.replaceState( {} , , updateURLParameter(urlPath, "ajax", "1"));
}

function refresh_div(url,div){
	processAjaxData(url);
	$.ajax({
		type: "GET",
		url: url,
		success: function(data, textStatus) {
			$(div).html(data);
		},
		error:function(exception){alert('Exeption:'+exception);}
	});
}
