<?php

use Dingo\Api\Routing\Router;

/** @var Router $api */
$api = app(Router::class);

$api->version('v1', function (Router $api) {
    $api->group(['prefix' => 'auth'], function(Router $api) {
        $api->post('signup', 'App\\Api\\V1\\Controllers\\SignUpController@signUp');
        $api->post('login', 'App\\Api\\V1\\Controllers\\LoginController@login');

        $api->post('recovery', 'App\\Api\\V1\\Controllers\\ForgotPasswordController@sendResetEmail');
        $api->post('reset', 'App\\Api\\V1\\Controllers\\ResetPasswordController@resetPassword');

        $api->post('logout', 'App\\Api\\V1\\Controllers\\LogoutController@logout');
        $api->post('refresh', 'App\\Api\\V1\\Controllers\\RefreshController@refresh');
        $api->get('me', 'App\\Api\\V1\\Controllers\\UserController@me');
    });

    $api->group(['middleware' => 'jwt.auth'], function(Router $api) {
        // User Controller
        $api->resource('user', 'App\\Api\\V1\\Controllers\\UserController');


        // Book Controller
        $api->resource('book', 'App\\Api\\V1\\Controllers\\BookController');
        
        // Peminjaman Controller
        $api->get('peminjaman/create', 'App\\Api\\V1\\Controllers\\PeminjamanController@create');
        $api->get('peminjaman/{peminjaman}/edit', 'App\\Api\\V1\\Controllers\\PeminjamanController@edit');
        $api->resource('peminjaman', 'App\\Api\\V1\\Controllers\\PeminjamanController');
    });

});
