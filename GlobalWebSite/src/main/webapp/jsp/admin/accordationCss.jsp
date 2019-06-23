<link rel="stylesheet" href="http://jrain.oscitas.netdna-cdn.com/tutorial/css/fontawesome-all.min.css">
 <style type="text/css">
      a:hover,a:focus{
    text-decoration: none;
    outline: none;
}
#accordion .panel{
    border: none;
    border-radius: 3px;
    box-shadow: none;
    margin-bottom: 15px;
}
#accordion .panel-heading{
    padding: 0;
    border: none;
    border-radius: 3px;
}
#accordion .panel-title a{
    display: block;
    padding: 12px 15px 12px 50px;
    background: linear-gradient(to bottom, #fefefe, #cdcdcd);
    border: 1px solid #c3c3c3;
    border-radius: 3px;
    font-size: 12px;
    font-weight: bold;
    color: #676767;
    text-shadow: 1px 1px 1px #fff;
    position: relative;
}
#accordion .panel-title a:before{
    content: "\f068";
    font-family: "Font Awesome 5 Free";
    width: 25px;
    height: 25px;
    line-height: 25px;
    border-radius: 50%;
    background: #929191;
    font-size: 12px;
    font-weight: 900;
    color: #fdfbfb;
    text-align: center;
    box-shadow: inset 0 0 10px rgba(0,0,0,0.5);
    text-shadow: none;
    position: absolute;
    top: 8px;
    left: 15px;
}
#accordion .panel-title a.collapsed:before{ content: "\f067"; }
#accordion .panel-body{
    padding: 10px 15px;
    font-size: 12px;
    color: #222;
    line-height: 27px;
    border: none;
}
#accordion .panel-body p{ margin-bottom: 0; }

/* The customcheck */
.customcheck {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 12px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* Hide the browser's default checkbox */
.customcheck input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Create a custom checkbox */
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #eee;
    border-radius: 5px;
}

/* On mouse-over, add a grey background color */
.customcheck:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.customcheck input:checked ~ .checkmark {
    background-color: #02cf32;
    border-radius: 5px;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the checkmark when checked */
.customcheck input:checked ~ .checkmark:after {
    display: block;
}

/* Style the checkmark/indicator */
.customcheck .checkmark:after {
    left: 9px;
    top: 5px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}
      
      </style>