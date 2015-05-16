<?php

$url= "https://twitter.com/thebestion";
$qt = @file_get_contents($url);

if($qt!=""){

$dn = explode('com/',$url);
$dn = $dn[1];

$lt = explode('data-aria-label-part="0">',$qt);
$lt = explode('</p>',$lt[1]);
$lt = strip_tags($lt[0]);

$tc = explode('statuses_count&quot;:', $qt);
$tc = explode(',&quot;', $tc[1]);
$tc = $tc[0];

$fc = explode('followers_count&quot;:', $qt);
$fc = explode(',&quot;', $fc[1]);
$fc = $fc[0]; 


$arr['display_name'] = trim($dn);
$arr['followers_count'] = trim($fc);
$arr['statuses_count'] = trim($tc);
$arr['last_tweet'] = html_entity_decode($lt);

echo json_encode($arr);
}
?>
