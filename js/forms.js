function formhash2(form, password, password2, password3) {
    // Create a new element input, this will be our hashed password field. 
	if (password2.value == ''         || 
          password3.value == '' ) {
 
        alert('You must provide all the requested details. Please try again');
        return false;
    }
	if (password2.value.length < 6) {
        alert('Passwords must be at least 6 characters long.  Please try again');
        form.password2.focus();
        return false;
    }
 
    // At least one number, one lowercase and one uppercase letter 
    // At least six characters 
 
    var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/; 
    if (!re.test(password2.value)) {
        alert('Passwords must contain at least one number, one lowercase and one uppercase letter.  Please try again');
        return false;
    }
	
	// Check password and confirmation are the same
    if (password2.value != password3.value) {
        alert('Your password and confirmation do not match. Please try again');
        form.password2.focus();
        return false;
    }
	
    var p = document.createElement("input");
    var p2 = document.createElement("input");
    var p3 = document.createElement("input");
 
    // Add the new element to our form. 
    form.appendChild(p);
    p.name = "p";
    p.type = "hidden";
    p.value = hex_sha512(password.value);
 
	form.appendChild(p2);
    p2.name = "new1";
    p2.type = "hidden";
    p2.value = hex_sha512(password2.value);
 
	form.appendChild(p3);
    p3.name = "new2";
    p3.type = "hidden";
    p3.value = hex_sha512(password3.value);
 
    // Make sure the plaintext password doesn't get sent. 
    password.value = "";
    password2.value = "";
    password3.value = "";
 
    // Finally submit the form. 
    form.submit();	
}

function formhash(form, password) {
    // Create a new element input, this will be our hashed password field. 
    var p = document.createElement("input");
 
    // Add the new element to our form. 
    form.appendChild(p);
    p.name = "p";
    p.type = "hidden";
    p.value = hex_sha512(password.value);
 
    // Make sure the plaintext password doesn't get sent. 
    password.value = "";
 
    // Finally submit the form. 
    form.submit();
}
 
function regformhash(form, uid, email, email2, password, conf) {
     // Check each field has a value
    if (uid.value == ''         || 
          email.value == ''     || 
          password.value == ''  || 
          conf.value == '') {
 
        alert('You must provide all the requested details. Please try again');
        return false;
    }
 
    // Check the username
 
    re = /^\w+$/; 
    if(!re.test(form.username.value)) { 
        alert("Username must contain only letters, numbers and underscores. Please try again"); 
        form.username.focus();
        return false; 
    }
 
    // Check that the password is sufficiently long (min 6 chars)
    // The check is duplicated below, but this is included to give more
    // specific guidance to the user
    if (password.value.length < 6) {
        alert('Passwords must be at least 6 characters long.  Please try again');
        form.password.focus();
        return false;
    }
 
    // At least one number, one lowercase and one uppercase letter 
    // At least six characters 
 
    var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/; 
    if (!re.test(password.value)) {
        alert('Passwords must contain at least one number, one lowercase and one uppercase letter.  Please try again');
        return false;
    }
 
    // Check password and confirmation are the same
    if (password.value != conf.value) {
        alert('Your password and confirmation do not match. Please try again');
        form.password.focus();
        return false;
    }
 
    // Check email and confirmation are the same
    if (email.value != email2.value) {
        alert('Your email and confirmation do not match. Please try again');
        form.email.focus();
        return false;
    }
 
    // Create a new element input, this will be our hashed password field. 
    var p = document.createElement("input");
 
    // Add the new element to our form. 
    form.appendChild(p);
    p.name = "p";
    p.type = "hidden";
    p.value = hex_sha512(password.value);
 
    // Make sure the plaintext password doesn't get sent. 
    password.value = "";
    conf.value = "";
 
    // Finally submit the form. 
    form.submit();
    return true;
}