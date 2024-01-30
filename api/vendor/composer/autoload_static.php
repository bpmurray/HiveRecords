<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitb66d8fac611e321ec77edbdba7b9ea9f
{
    public static $prefixLengthsPsr4 = array (
        'F' => 
        array (
            'Firebase\\JWT\\' => 13,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Firebase\\JWT\\' => 
        array (
            0 => __DIR__ . '/..' . '/firebase/php-jwt/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitb66d8fac611e321ec77edbdba7b9ea9f::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitb66d8fac611e321ec77edbdba7b9ea9f::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitb66d8fac611e321ec77edbdba7b9ea9f::$classMap;

        }, null, ClassLoader::class);
    }
}
