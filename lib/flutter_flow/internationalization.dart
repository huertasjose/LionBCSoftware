import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // barbersReview
  {
    '0oeso5ol': {
      'es': 'Reviews de cada Barbero',
      'en': 'Reviews of each Barber',
    },
    'bmzqe6di': {
      'es': '# de reviews',
      'en': '# of reviews',
    },
    'dwif0zfi': {
      'es': 'Reviews Generales',
      'en': 'General Reviews',
    },
    'lt4uty9i': {
      'es': 'Por barbero',
      'en': 'By barber',
    },
    'd9jni9pb': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    'r70aof5h': {
      'es': 'Option 2',
      'en': 'Option 2',
    },
    'f20cxzqo': {
      'es': 'Option 3',
      'en': 'Option 3',
    },
    'j2gci2fv': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // editarPerfil
  {
    '37t606h4': {
      'es': 'Nombre Completo',
      'en': 'Full Name',
    },
    'u6zk9p3s': {
      'es': 'Your full name...',
      'en': 'Your full name...',
    },
    '7nt2jgon': {
      'es': 'Correo Electrónico',
      'en': 'Email',
    },
    '4d2wgkxs': {
      'es': 'Your email..',
      'en': 'Your email..',
    },
    '276n33ca': {
      'es': 'Numero de telefono',
      'en': 'Phone number',
    },
    'vykg12hh': {
      'es': 'Telefono',
      'en': 'Phone',
    },
    'tc26xu3c': {
      'es': 'Guardar Cambios',
      'en': 'Save Changes',
    },
    'najv9es6': {
      'es': 'Editar perfil',
      'en': 'Edit profile',
    },
    '861ww4ea': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // changePassword
  {
    'z80qyipb': {
      'es': 'Correo Electónico',
      'en': 'Email',
    },
    '8yenljww': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'hlcqsphc': {
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña; ingrese el correo electrónico asociado con su cuenta arriba.',
      'en':
          'We\'ll send you an email with a link to reset your password; enter the email address associated with your account above.',
    },
    'uxzzup9q': {
      'es': 'Enviar Link ',
      'en': 'Send Link',
    },
    'xdm56f3e': {
      'es': 'Cambiar contraseña',
      'en': 'Change password',
    },
    'b7d2jf5j': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // CrearProducto
  {
    'e93vrbqo': {
      'es': 'Nombre del producto',
      'en': 'Product name',
    },
    'xmgpjnvz': {
      'es': 'Escriba el nombre del producto',
      'en': 'Enter the name of the product',
    },
    '8r5xojts': {
      'es': 'Descripción del producto',
      'en': 'Product description',
    },
    '7kz9vx6d': {
      'es': 'Escriba una breve descripción para el producto',
      'en': 'Write a short description for the product',
    },
    'r248811j': {
      'es': 'Nombre del proveedor',
      'en': 'Supplier name',
    },
    '16g7kz9n': {
      'es': 'Escriba el nombre del proveedor',
      'en': 'Enter the name of the supplier',
    },
    'uhjnlpth': {
      'es': 'Precio compra del producto',
      'en': 'Purchase price of the product',
    },
    'fjs97m1f': {
      'es': 'Escriba el precio de compra del producto',
      'en': 'Enter the purchase price of the product',
    },
    'c54ptz4x': {
      'es': 'Precio venta del producto',
      'en': 'Selling price of the product',
    },
    'hqyl9zs7': {
      'es': 'Escriba el precio de venta del producto',
      'en': 'Enter the selling price of the product',
    },
    'yu722732': {
      'es': 'Cantidad en el inventario',
      'en': 'Quantity in inventory',
    },
    '1fupg1k3': {
      'es': 'Cantidad de productos en inventario',
      'en': 'Quantity of products in inventory',
    },
    '41h53lm8': {
      'es': 'Seleccionar Filtros',
      'en': 'Select Filters',
    },
    'pcvo3ybf': {
      'es': 'Todos',
      'en': 'All',
    },
    't4qqnomp': {
      'es': 'Ceras',
      'en': 'Waxes',
    },
    'p3f8oqsj': {
      'es': 'Lacas',
      'en': 'Lacquers',
    },
    'ml5gipdd': {
      'es': 'Polvos',
      'en': 'Powder',
    },
    'afh8haok': {
      'es': 'Shampoo',
      'en': 'Shampoo',
    },
    'omo5gxwb': {
      'es': 'Gel',
      'en': 'Gel',
    },
    'c85qznct': {
      'es': 'Cremas',
      'en': 'Creams',
    },
    'eos2q2wo': {
      'es': 'Guardar',
      'en': 'Keep',
    },
    'dt6k1a6u': {
      'es': 'Escriba el nombre del producto es requerido',
      'en': 'Enter the product name is required',
    },
    'ip9xyy37': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '8nb38jns': {
      'es': 'Escriba una breve descripción para el producto es requerido',
      'en': 'Write a short description for the product is required',
    },
    'dwxlnkfz': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'zmj9u977': {
      'es': 'Escriba el nombre del proveedor es requerido',
      'en': 'Enter the name of the supplier is required',
    },
    'j88doa3k': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'wq8s81l5': {
      'es': 'Escriba el precio de compra del producto es requerido',
      'en': 'Enter the purchase price of the product is required',
    },
    'mmhujx1h': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'jhvw8zx2': {
      'es': 'Escriba el precio de venta del producto es requerido',
      'en': 'Enter the selling price of the product is required',
    },
    'dh2npa2q': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'yiwfm8mv': {
      'es': 'Cantidad de productos en inventario es requerido',
      'en': 'Quantity of products in inventory is required',
    },
    'rygpt1xf': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '0lyy8xmq': {
      'es': 'Añadir Producto',
      'en': 'Add Product',
    },
    'bd78p3ud': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Menu
  {
    'uyu6cixk': {
      'es': 'Tu estilo, nuestra pasión',
      'en': 'Your style, our passion',
    },
    '0ljp4nw8': {
      'es': 'Reservar Ahora',
      'en': 'Book Now',
    },
    'zz68plof': {
      'es': 'Servicios',
      'en': 'Services',
    },
    'c9kiaur6': {
      'es': 'Reservar',
      'en': 'Reserve',
    },
    '516durf1': {
      'es': 'Productos',
      'en': 'Products',
    },
    '7ca6sdos': {
      'es': 'Todos',
      'en': 'All',
    },
    'g5b5vc6b': {
      'es': 'Ceras',
      'en': 'Waxes',
    },
    'ujlvx952': {
      'es': 'Lacas',
      'en': 'Lacquers',
    },
    '6jc8n1jc': {
      'es': 'Polvos',
      'en': 'Powder',
    },
    'xsh32isq': {
      'es': 'Shampoo',
      'en': 'Shampoo',
    },
    'r4tprwia': {
      'es': 'Gel',
      'en': 'Gel',
    },
    'tgykpejh': {
      'es': 'Cremas',
      'en': 'Creams',
    },
    'lsji9ufb': {
      'es': 'Balzamo',
      'en': 'Balzamo',
    },
    'ueebyies': {
      'es': 'Perfumes',
      'en': 'Perfumes',
    },
    'lk62hvrr': {
      'es': 'Otros',
      'en': 'Others',
    },
    'k0xsix3f': {
      'es': 'Perfil',
      'en': 'Profile',
    },
    'x3g9ej92': {
      'es': 'Detalles de la cuenta',
      'en': 'Account details',
    },
    'vijodcx8': {
      'es': 'Editar perfil',
      'en': 'Edit profile',
    },
    'ik5rbd2v': {
      'es': 'Cambiar contraseña',
      'en': 'Change password',
    },
    'pjhwbsdg': {
      'es': 'Historial de citas agendadas',
      'en': 'Appointment history',
    },
    'p2wrasjz': {
      'es': 'Configuracion',
      'en': 'Configuration',
    },
    '3013z3sl': {
      'es': 'Lenguaje: ',
      'en': 'Language:',
    },
    'baoh4gsw': {
      'es': 'Envíanos tus comentarios',
      'en': 'Language:',
    },
    'kk9td11n': {
      'es': 'Volver al menú de administrador',
      'en': 'Return to the administrator menu',
    },
    'rns792b7': {
      'es': 'Cerrar Sesión',
      'en': 'Log Out',
    },
    'cl62dxrm': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // AgendarCita
  {
    '6msxx0bg': {
      'es': 'Mes',
      'en': 'Month',
    },
    'xxdz5cia': {
      'es': 'Seleccionar barbero',
      'en': 'Select barber',
    },
    '17bhm1vh': {
      'es': 'Semana',
      'en': 'Week',
    },
    'au9cjewf': {
      'es': 'Seleccionar barbero',
      'en': 'Select barber',
    },
    'g09nxvlw': {
      'es': 'Seleccionar Fecha',
      'en': 'Select Date',
    },
    'xhua0v76': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // SeleccionarBarbero
  {
    'nbfymzg6': {
      'es': 'Seleccionar Barbero',
      'en': 'Select Barber',
    },
    'k849fijc': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Empleados
  {
    'bwg4ez4g': {
      'es': 'Empleados',
      'en': 'Employees',
    },
    'dhchi2qc': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Login
  {
    'qzopz0xp': {
      'es': 'LION BC',
      'en': 'LION BC',
    },
    'mam2mjbn': {
      'es': '¡BIENVENIDO!',
      'en': 'WELCOME!',
    },
    'xe3xymt6': {
      'es': 'Rellene la información para ingresar correctamente a su cuenta',
      'en': 'Fill in the information to successfully log into your account.',
    },
    'bq3cd43y': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'svjr15qa': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'aqg4cr4f': {
      'es': 'Iniciar Sesión',
      'en': 'Login',
    },
    'v9fyvoqt': {
      'es': 'Iniciar con',
      'en': 'Start with',
    },
    '136f77tj': {
      'es': 'Continuar con Google',
      'en': 'Continue with Google',
    },
    'hxeu3p36': {
      'es': 'No tienes una cuenta?  ',
      'en': 'Don\'t have an account?',
    },
    'sit2b30o': {
      'es': 'Registrate',
      'en': 'Register',
    },
    'kklcz67u': {
      'es': 'Olvidaste la contraseña?    ',
      'en': 'Forgot your password?',
    },
    'xz1luufy': {
      'es': 'Recuperar',
      'en': 'Recover',
    },
    'it8pqrf9': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Register
  {
    'i2veypno': {
      'es': 'LION BC',
      'en': 'LION BC',
    },
    'b5nh5d64': {
      'es': 'Registrarse',
      'en': 'Register',
    },
    'rb1n804w': {
      'es': 'Registre sus datos para crear una cuenta',
      'en': 'Register your details to create an account',
    },
    'quvmql6z': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'iufkgfae': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'xnvba91g': {
      'es': 'Repetir Contraseña',
      'en': 'Repeat Password',
    },
    'vjgu4wlt': {
      'es': 'Nombre completo',
      'en': 'Full name',
    },
    '5zrauc51': {
      'es': 'Teléfono',
      'en': 'Phone',
    },
    '6ycuk6as': {
      'es': 'Crear Cuenta',
      'en': 'Create Account',
    },
    't5pnt7qu': {
      'es': 'Crear con',
      'en': 'Create with',
    },
    'cy72mosb': {
      'es': 'Continuar con Google',
      'en': 'Continue with Google',
    },
    'doqi3fuj': {
      'es': 'Continuar con Apple',
      'en': 'Continue with Apple',
    },
    'vzk953xe': {
      'es': 'Ya tienes una cuenta?   ',
      'en': 'Do you already have an account?',
    },
    'nep6kouh': {
      'es': 'Inicia Sesión',
      'en': 'Sign In',
    },
    'l8x0efcc': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // ErrorCompartido
  {
    'lfc4tc7g': {
      'es':
          '\"Ha ocurrido un error inesperado, reinicie el sistema e inténtelo de nuevo, si el problema sigue ocurriendo, intentarlo más tarde\"',
      'en':
          '\"An unexpected error has occurred. Please restart your system and try again. If the problem persists, please try again later.\"',
    },
    '8gvqu2zr': {
      'es': 'Cerrar Sistema',
      'en': 'Close System',
    },
    '8a4n02ar': {
      'es': '¡Ha Pasado Algo Inesperado!',
      'en': 'Something Unexpected Has Happened!',
    },
    'pgyfdhmf': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Carrito
  {
    'dxh6cigg': {
      'es': 'Total',
      'en': 'Total',
    },
    'eb3m9jkw': {
      'es': 'Reservar',
      'en': 'Reserve',
    },
    'dr78d0gs': {
      'es': 'Carrito',
      'en': 'Cart',
    },
    '11xpdqsn': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Settings
  {
    '2ptc18ug': {
      'es': 'Activar notificaciones',
      'en': 'Activate notifications',
    },
    'i65bffvn': {
      'es': 'Recibe notificaiones de la app',
      'en': 'Receive notifications from the app',
    },
    'y76q7rhg': {
      'es': 'Email notificaciones',
      'en': 'Email notifications',
    },
    'zk4f6j1d': {
      'es': 'Recibe correos electronicos ',
      'en': 'Receive emails',
    },
    'xqo7h3la': {
      'es': 'Configuraciones',
      'en': 'Settings',
    },
    '55colra0': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Citas
  {
    'x38gq4ln': {
      'es': 'Reservadas',
      'en': 'Reserved',
    },
    'oof0asfa': {
      'es': 'Fecha de cita:',
      'en': 'Appointment date:',
    },
    'g0gpja12': {
      'es': 'Hora Cita:',
      'en': 'Appointment Time:',
    },
    'a8uu6m0f': {
      'es': 'Barbero:',
      'en': 'Barber:',
    },
    'bbd9p9hs': {
      'es': 'Reservada',
      'en': 'Reserved',
    },
    'wza1e5nl': {
      'es': 'Completadas',
      'en': 'Completed',
    },
    'azuwmmpd': {
      'es': 'Completada',
      'en': 'Completed',
    },
    'wiq3xg3z': {
      'es': 'Fecha de cita:',
      'en': 'Appointment date:',
    },
    '96zwpkus': {
      'es': 'Hora Cita:',
      'en': 'Appointment Time:',
    },
    '26m1lhnk': {
      'es': 'Barbero:',
      'en': 'Barber:',
    },
    'ovi1462i': {
      'es': 'Calificar Servicio',
      'en': 'Rate Service',
    },
    'p76hjz63': {
      'es': 'Citas',
      'en': 'Quotes',
    },
    '1i42myzr': {
      'es': 'My Trips',
      'en': 'My Trips',
    },
  },
  // listaPedidos
  {
    'q0alhu8x': {
      'es': 'Pedidos',
      'en': 'Orders',
    },
    'mak1fdmw': {
      'es': 'Actuales',
      'en': 'Current',
    },
    'vrij9pa3': {
      'es': 'Pedidos actuales',
      'en': 'Current orders',
    },
    '51rk0vvl': {
      'es': 'Cliente: ',
      'en': 'Customer:',
    },
    'ah94vpll': {
      'es': 'Productos:  ',
      'en': 'Products:',
    },
    's050b9y7': {
      'es': 'Precio: ',
      'en': 'Price:',
    },
    'hmbkh87k': {
      'es': 'Pasados',
      'en': 'Past',
    },
    'zf969fw1': {
      'es': 'Pedidos pasados',
      'en': 'Past orders',
    },
    'npj28jkg': {
      'es': 'Cliente: ',
      'en': 'Customer:',
    },
    '4qix1s56': {
      'es': 'Productos:  ',
      'en': 'Products:',
    },
    '26w25tbu': {
      'es': 'Precio: ',
      'en': 'Price:',
    },
    'dv9e7qwt': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Contadores
  {
    'mcn2oesm': {
      'es': 'Gestión Financiera',
      'en': 'Financial Management',
    },
    'huydhlpj': {
      'es': 'Resumen Financiero',
      'en': 'Financial Summary',
    },
    'w7l2glgm': {
      'es': 'Ingresos del Mes',
      'en': 'Income of the Month',
    },
    'd0lem1fv': {
      'es': '₡2,450,000',
      'en': '₡2,450,000',
    },
    'xwhkbm73': {
      'es': 'Gastos del Mes',
      'en': 'Monthly Expenses',
    },
    'rct3h8k8': {
      'es': '₡1,850,000',
      'en': '₡1,850,000',
    },
    '5cc2mb84': {
      'es': 'Empleados',
      'en': 'Employees',
    },
    '94xi39qf': {
      'es': 'JH',
      'en': 'JH',
    },
    'jqo12mnd': {
      'es': 'Jose Huertas',
      'en': 'Jose Huertas',
    },
    '8g52yw3x': {
      'es': 'Barbero Principal',
      'en': 'Head Barber',
    },
    'hc2snz8v': {
      'es': 'Salario Base',
      'en': 'Base Salary',
    },
    'kc0d8p70': {
      'es': '₡240,000',
      'en': '₡240,000',
    },
    '2kj95hdz': {
      'es': 'Comisión',
      'en': 'Commission',
    },
    '8wd8zzr1': {
      'es': '30%',
      'en': '30%',
    },
    'ablqsjke': {
      'es': 'JQ',
      'en': 'JQ',
    },
    'u3qv4weu': {
      'es': 'Jeremy Quiros',
      'en': 'Jeremy Quiros',
    },
    'ya4a8i7l': {
      'es': 'Barbero',
      'en': 'Barber',
    },
    'ypdateuc': {
      'es': 'Salario Base',
      'en': 'Base Salary',
    },
    'pnr2akdh': {
      'es': '₡220,000',
      'en': '₡220,000',
    },
    'qb3blx27': {
      'es': 'Comisión',
      'en': 'Commission',
    },
    'km1m70lp': {
      'es': '25%',
      'en': '25%',
    },
    'ern0pdd6': {
      'es': 'Pagos Pendientes',
      'en': 'Pending Payments',
    },
    'u1z42qsk': {
      'es': 'Seleccione el periodo...',
      'en': 'Select the period...',
    },
    '4r99n9w0': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'spano740': {
      'es': 'Día',
      'en': 'Day',
    },
    'jktgu27v': {
      'es': 'Semana',
      'en': 'Week',
    },
    'eczwjbru': {
      'es': 'Mes',
      'en': 'Month',
    },
    'c4xr1ppx': {
      'es': 'Aguinaldo',
      'en': 'Christmas bonus',
    },
    '06q3zzo6': {
      'es': '₡320,000',
      'en': '₡320,000',
    },
    '1rnwmry8': {
      'es': 'Vacaciones',
      'en': 'Vacation',
    },
    'esbd28qp': {
      'es': '₡180,000',
      'en': '₡180,000',
    },
    'i65100a2': {
      'es': 'Acciones Rápidas',
      'en': 'Quick Actions',
    },
    'p9nryas7': {
      'es': 'Registrar Pago',
      'en': 'Register Payment',
    },
    '28fdnn60': {
      'es': 'Generar Reporte',
      'en': 'Generate Report',
    },
    '7m6jrh6m': {
      'es': 'Ver Estadísticas',
      'en': 'See Statistics',
    },
  },
  // menuAdmin
  {
    'dzlwrfdt': {
      'es': 'Gestión de Personal',
      'en': 'Personnel Management',
    },
    'y1hy610f': {
      'es': 'Empleados',
      'en': 'Employees',
    },
    'ucq8lc9t': {
      'es': 'Administrar personal',
      'en': 'Manage staff',
    },
    '81rc8iem': {
      'es': 'Reportes y Análisis',
      'en': 'Reports and Analysis',
    },
    'e65jan60': {
      'es': 'Reportes Financieros',
      'en': 'Financial Reports',
    },
    'k9smp6nn': {
      'es': 'Ingresos y gastos',
      'en': 'Income and expenses',
    },
    'ujlckbnj': {
      'es': 'Reviews Barberos',
      'en': 'Barber Reviews',
    },
    '7vmj1ge0': {
      'es': 'Ingresos y gastos',
      'en': 'Income and expenses',
    },
    'mpu0b6p8': {
      'es': 'Opiniones de los usuarios',
      'en': 'Barber Reviews',
    },
    'amixfx3g': {
      'es': 'Mensajes para mejorar',
      'en': 'Income and expenses',
    },
    'uqvxklss': {
      'es': 'Pedidos',
      'en': 'Orders',
    },
    'zjh1t0zq': {
      'es': 'Pedidos ',
      'en': 'Orders',
    },
    'tqbts9xc': {
      'es': 'Pedidos que los clientes han realizado',
      'en': 'Orders that customers have placed',
    },
    '4tbqsem5': {
      'es': 'Gestion de Inventario',
      'en': 'Inventory Management',
    },
    '34b8wou4': {
      'es': 'Gestión de Productos',
      'en': 'Product Management',
    },
    'osvuk3ji': {
      'es': 'Pedidos que los clientes han realizado',
      'en': 'Orders that customers have placed',
    },
    'wyfa86d5': {
      'es': 'Registro de servicios',
      'en': 'Service registration',
    },
    '1siekxjv': {
      'es': 'Administrador de Servicios',
      'en': 'Service Administrator',
    },
    'g196e0qb': {
      'es': 'Administración de los servicios',
      'en': '',
    },
    'tomqwtq7': {
      'es': 'Citas',
      'en': 'Quotes',
    },
    'he5tmaw0': {
      'es': 'Citas que los clientes han agendado',
      'en': 'Appointments that clients have scheduled',
    },
    'goq2w543': {
      'es': 'Usuarios',
      'en': 'Users',
    },
    '5p5kksxs': {
      'es': 'Usuarios Registrados',
      'en': 'Registered Users',
    },
    'neqsle43': {
      'es': 'Permite ver los usuarios registrados \nen la barbería',
      'en': 'Allows you to view registered users in the barbershop.',
    },
    'nuk62drh': {
      'es': 'Menu Administrativo',
      'en': 'Administrative Menu',
    },
  },
  // VistaProducto
  {
    'nj8r6h4z': {
      'es': 'DESCRIPCIÓN',
      'en': 'DESCRIPTION',
    },
    'wi5l2wat': {
      'es': 'Añadir al carrito',
      'en': 'Add to cart',
    },
    'q143ozf0': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // ServicioEditar
  {
    '35ae8pdl': {
      'es': 'Información del Servicio',
      'en': 'Service Information',
    },
    'd4obcolc': {
      'es': 'Nombre del Servicio',
      'en': 'Service Name',
    },
    'iomqyebz': {
      'es': 'Ej: Corte de Cabello Clásico',
      'en': 'Eg: Classic Haircut',
    },
    'qzaibkzq': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'p4dl32tq': {
      'es': 'Describe los detalles del servicio...',
      'en': 'Describe the details of the service...',
    },
    'x7kbh1z7': {
      'es': 'Precio',
      'en': 'Price',
    },
    'h52aqm1w': {
      'es': '₡0.00',
      'en': '₡0.00',
    },
    '8ydy2zoz': {
      'es': 'Duración Aproximada',
      'en': 'Approximate Duration',
    },
    'zbzhaeaj': {
      'es': 'Ej: 30 minutos',
      'en': 'Eg: 30 minutes',
    },
    'w0g64psn': {
      'es': 'Editar Servicio',
      'en': 'Edit Service',
    },
    '8yjfb993': {
      'es': 'Editar Servicio',
      'en': 'Edit Service',
    },
  },
  // ServicioAgregar
  {
    'vrlid3vd': {
      'es': 'Información del Servicio',
      'en': 'Service Information',
    },
    'ffl62k6o': {
      'es': 'Nombre del Servicio',
      'en': 'Service Name',
    },
    'osf2cl10': {
      'es': 'Ej: Corte Básico',
      'en': 'Eg: Basic Cut',
    },
    '7rrxx6sv': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'k81l98hk': {
      'es': 'Describe los detalles del servicio...',
      'en': 'Describe the details of the service...',
    },
    'u1e66foo': {
      'es': 'Precio',
      'en': 'Price',
    },
    'iprmmvot': {
      'es': '₡0.00',
      'en': '₡0.00',
    },
    'l13v6u43': {
      'es': 'Duración Aproximada',
      'en': 'Approximate Duration',
    },
    'ia91acw0': {
      'es': 'Ej: 30 minutos',
      'en': 'Eg: 30 minutes',
    },
    '5ncd75qo': {
      'es': 'Imagen del servicio',
      'en': 'Service image',
    },
    'm6ctx466': {
      'es': 'Nombre del servicio es requerido',
      'en': 'Service name is required',
    },
    '253a1a19': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'dzo9tjr2': {
      'es': 'Describir los detalles del servicio es requerido',
      'en': 'Describing the details of the service is required',
    },
    'pdt6zbfa': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'bn7159y4': {
      'es': 'Precio es requerido',
      'en': 'Price is required',
    },
    '5jouecxf': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'qihn1gtl': {
      'es': 'Duración es requerido',
      'en': 'Duration is required',
    },
    '8s68pu2y': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'qgp106bi': {
      'es': 'Crear Servicio',
      'en': 'Create Service',
    },
    '65yu0kuf': {
      'es': 'Crear Servicio',
      'en': 'Create Service',
    },
  },
  // Servicios
  {
    'c9771mbh': {
      'es': 'Servicios',
      'en': 'Services',
    },
    'eneiakod': {
      'es': 'Lista de Servicios',
      'en': 'List of Services',
    },
    'ocwn58vh': {
      'es': 'Agregar Servicio',
      'en': 'Add Service',
    },
    'aar5wxbf': {
      'es': 'Duración: ',
      'en': 'Duration:',
    },
    'wv99iiv4': {
      'es': 'Precio:',
      'en': 'Price:',
    },
    'pojpkejo': {
      'es': 'Barba',
      'en': 'Beard',
    },
    '98hr2da8': {
      'es': '\$150.00',
      'en': '\$150.00',
    },
    'b9zd9obb': {
      'es': 'Corte y Barba',
      'en': 'Cut and Beard',
    },
    'mahc0ac9': {
      'es': '\$300.00',
      'en': '\$300.00',
    },
    'zi85azdc': {
      'es': 'Facial Completo',
      'en': 'Full Facial',
    },
    'lkdmioq2': {
      'es': '\$400.00',
      'en': '\$400.00',
    },
    'zshlbbbh': {
      'es': 'Tinte de Cabello',
      'en': 'Hair Dye',
    },
    'vq31htol': {
      'es': '\$500.00',
      'en': '\$500.00',
    },
  },
  // EditarEmpleado
  {
    '4bwdg4co': {
      'es': 'Información Personal',
      'en': 'Personal Information',
    },
    'io3kdmes': {
      'es': 'Nombre Completo',
      'en': 'Full Name',
    },
    'rbl769mu': {
      'es': 'Correo Electrónico',
      'en': 'Email',
    },
    'oc1s4wa5': {
      'es': 'Teléfono',
      'en': 'Phone',
    },
    'jvb67ckv': {
      'es': 'Rol del Empleado',
      'en': 'Employee Role',
    },
    'zv28v9o2': {
      'es': 'Barbero',
      'en': 'Barber',
    },
    'midcxzu3': {
      'es': 'Funciones de Barberos',
      'en': 'Functions of Barbers',
    },
    'rm1w9t34': {
      'es': 'Administrador',
      'en': 'Administrator',
    },
    '972yfy4x': {
      'es': 'Funciones de Aministración',
      'en': 'Administration Functions',
    },
    'pjnfkx9b': {
      'es': 'Editar Empleado',
      'en': 'Edit Employee',
    },
    'xzooc06c': {
      'es': 'Editar Empleado',
      'en': 'Edit Employee',
    },
  },
  // confirmacion
  {
    '648uittr': {
      'es': '¡Cita Confirmada!',
      'en': 'Appointment Confirmed!',
    },
    'oe4rjcuz': {
      'es': 'Tu cita ha sido programada exitosamente',
      'en': 'Your appointment has been successfully scheduled.',
    },
    '6aasectv': {
      'es': 'Detalles de la Cita',
      'en': 'Appointment Details',
    },
    'zd3tq9yl': {
      'es': 'Fecha',
      'en': 'Date',
    },
    'xp3wbs48': {
      'es': 'Hora',
      'en': 'Hour',
    },
    '1gd3g2lw': {
      'es': 'Barbero',
      'en': 'Barber',
    },
    'k9czx1e9': {
      'es': 'Volver al Inicio',
      'en': 'Return to Home',
    },
  },
  // ventasTotales
  {
    'd66ui04t': {
      'es': 'Randy Alcorn',
      'en': 'Randy Alcorn',
    },
    '140yilzd': {
      'es': '240 Sales',
      'en': '240 Sales',
    },
    'od5qlchk': {
      'es': 'San Antonio, Tx.',
      'en': 'San Antonio, TX',
    },
    '25u1zms3': {
      'es': 'Lions BC',
      'en': 'Lions BC',
    },
    'eqacz2eq': {
      'es': '240 Sales',
      'en': '240 Sales',
    },
    'xn9msui5': {
      'es': 'San Jose, Costa Rica',
      'en': 'San Jose, Costa Rica',
    },
    'rd5md1oh': {
      'es': 'Servicios',
      'en': 'Services',
    },
    'ze39uajm': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'faruldti': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    'cji0lnvn': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'qhco8k28': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    '9ut5p0e0': {
      'es': 'Servicio',
      'en': 'Service',
    },
    '98vik5lz': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    '0nkqlebc': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'yostmzcb': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    '2uzvz7l4': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'kjmb5ul4': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    '9wlcahpc': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'p7ntbch8': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    '4zlv8ty8': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'x7713bn0': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    '24ck0ry3': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'txgar1xv': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    'y7h626qp': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'tazsiot8': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    'vomtilyu': {
      'es': 'Servicio',
      'en': 'Service',
    },
    '9seiy9ql': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    'cw96iudx': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'eju21nd5': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    'yf8id0rv': {
      'es': 'Servicios completados',
      'en': 'Services completed',
    },
    '1am6yl0l': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'rrx0gq43': {
      'es': 'Fecha',
      'en': 'Date',
    },
    'psv70vhy': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    'mhzx4ev6': {
      'es': 'Servicio',
      'en': 'Service',
    },
    '64exckgh': {
      'es': 'Fecha',
      'en': 'Date',
    },
    'f2vhxq60': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    'd4kwp25b': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'ine5y2bk': {
      'es': 'Fecha',
      'en': 'Date',
    },
    'z0xhfrmh': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    'sfozudh9': {
      'es': 'Servicio',
      'en': 'Service',
    },
    '6a30i6cj': {
      'es': 'Fecha',
      'en': 'Date',
    },
    'mji82cbt': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    '048dnnre': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'thp1ngkp': {
      'es': 'Fecha',
      'en': 'Date',
    },
    '2r2d4c03': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    '7xlqkolp': {
      'es': 'Servicio',
      'en': 'Service',
    },
    'qlcs4m2j': {
      'es': 'Fecha',
      'en': 'Date',
    },
    '7tu91vf1': {
      'es': '\$126.20',
      'en': '\$126.20',
    },
    'nojqb62v': {
      'es': 'Reviews',
      'en': 'Reviews',
    },
    'hi7dvfd2': {
      'es': 'Overall',
      'en': 'Overall',
    },
    'f0aouznx': {
      'es': '5',
      'en': '5',
    },
    'mywdxhcs': {
      'es': 'UserName',
      'en': 'Username',
    },
    'j7afjjim': {
      'es': 'user@domainname.com',
      'en': 'user@domainname.com',
    },
    '6jvbsiw3': {
      'es': 'Overall',
      'en': 'Overall',
    },
    'nykmxn2t': {
      'es': '5',
      'en': '5',
    },
    't4x7c6b9': {
      'es':
          '\"These sports shoes are incredibly comfortable, lightweight, and provide excellent support for my feet during workouts and runs. I\'ve noticed a significant improvement in my performance since wearing them!\"',
      'en':
          '\"These sports shoes are incredibly comfortable, lightweight, and provide excellent support for my feet during workouts and runs. I\'ve noticed a significant improvement in my performance since wearing them!\"',
    },
    'qzc52zz1': {
      'es': 'Seccion de ventas',
      'en': 'Sales section',
    },
    'bk63dljp': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // CitasAdministrador
  {
    '78tzsp7l': {
      'es': 'Reservadas',
      'en': 'Reserved',
    },
    '0uxa3q8j': {
      'es': 'Fecha de cita:',
      'en': 'Appointment date:',
    },
    'kibsdgng': {
      'es': 'Hora Cita:',
      'en': 'Appointment Time:',
    },
    'ueovux82': {
      'es': 'Barbero:',
      'en': 'Barber:',
    },
    'vtqlznkv': {
      'es': 'Cliente:',
      'en': 'Customer:',
    },
    'ogdw837d': {
      'es': 'Reservada',
      'en': 'Reserved',
    },
    '9snz03xu': {
      'es': 'Completadas',
      'en': 'Completed',
    },
    'k2ewjjp8': {
      'es': 'Fecha de cita:',
      'en': 'Appointment date:',
    },
    'hwweg4zi': {
      'es': 'Hora Cita:',
      'en': 'Appointment Time:',
    },
    'ox798zkm': {
      'es': 'Barbero:',
      'en': 'Barber:',
    },
    'gl59n61i': {
      'es': 'Cliente:',
      'en': 'Customer:',
    },
    'oa15kcix': {
      'es': 'Servicio:',
      'en': 'Service:',
    },
    'vekgepsb': {
      'es': 'Terminar Cita',
      'en': 'End Appointment',
    },
    '4w7x4d17': {
      'es': 'Completada',
      'en': 'Completed',
    },
    '7ny492d4': {
      'es': 'Citas',
      'en': 'Quotes',
    },
    'yahb8anz': {
      'es': 'My Trips',
      'en': 'My Trips',
    },
  },
  // UsuariosRegistrados
  {
    'ummvb9u8': {
      'es': 'Clientes Registrados',
      'en': 'Registered Customers',
    },
    'odr85qx0': {
      'es': 'Rol Barbero',
      'en': 'Barber Role',
    },
    '7hil63wm': {
      'es': 'Estadísticas',
      'en': 'Statistics',
    },
    'w6v9i4oh': {
      'es': 'Usuarios',
      'en': 'Users',
    },
    'atwtiuk6': {
      'es': 'Totales',
      'en': 'Totals',
    },
    '2i72wjd7': {
      'es': 'Historial de Clientes',
      'en': 'Customer History',
    },
  },
  // AgregarServicioCita
  {
    'eh6bjtes': {
      'es': 'Estado de Cita',
      'en': 'Appointment Status',
    },
    'fedvm0mp': {
      'es': 'Terminada',
      'en': 'Finished',
    },
    'ywknqwha': {
      'es': 'Fecha:',
      'en': 'Date:',
    },
    'vu9h3p7c': {
      'es': 'Hora:',
      'en': 'Hour:',
    },
    'sd5j5ab0': {
      'es': 'Barbero:',
      'en': 'Barber:',
    },
    'l5tykgjz': {
      'es': 'Información del Cliente',
      'en': 'Customer Information',
    },
    'p1ykyz2w': {
      'es': 'Nombre:',
      'en': 'Name:',
    },
    'avi5l7di': {
      'es': 'Teléfono:',
      'en': 'Phone:',
    },
    '1xkc7xz4': {
      'es': 'Correo:',
      'en': 'Mail:',
    },
    'zarqa992': {
      'es': 'Servicio Realizado',
      'en': 'Service Performed',
    },
    'ah9b46zj': {
      'es': 'Servicio...',
      'en': 'Service...',
    },
    'kw4r97ph': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'kko4jdfz': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    'pdmbmg4k': {
      'es': 'Option 2',
      'en': 'Option 2',
    },
    'o2dmbxxj': {
      'es': 'Option 3',
      'en': 'Option 3',
    },
    '5shekx78': {
      'es': 'Completar Cita',
      'en': 'Complete Appointment',
    },
    'hdl6z5lu': {
      'es': 'Detalles de la cita',
      'en': 'Appointment details',
    },
  },
  // agendarHora
  {
    '0busfpbd': {
      'es': 'Seleccionar Hora',
      'en': 'Select Time',
    },
    'wjkjlip9': {
      'es': 'Detalles de la Cita',
      'en': 'Appointment Details',
    },
    'mteg9d6b': {
      'es': 'Barbero',
      'en': 'Barber',
    },
    'sg39aouw': {
      'es': 'Fecha',
      'en': 'Date',
    },
    '2exr730n': {
      'es': 'Horarios Disponibles',
      'en': 'Available Schedules',
    },
    'gbvhw6tr': {
      'es': 'Select...',
      'en': 'Select...',
    },
    '1gyqn6m3': {
      'es': 'Search...',
      'en': 'Search...',
    },
    '4nr4a55o': {
      'es': '9:30 AM',
      'en': '9:30 AM',
    },
    'whymmjl5': {
      'es': '10:00 AM',
      'en': '10:00 AM',
    },
    'brg7guti': {
      'es': '10:30 AM',
      'en': '10:30 AM',
    },
    'y74rje0m': {
      'es': '11:00 AM',
      'en': '11:00 AM',
    },
    '4jotvdch': {
      'es': '11:30 AM',
      'en': '11:30 AM',
    },
    '46wt8mg0': {
      'es': '1:00 PM',
      'en': '1:00 PM',
    },
    'hefhnxu1': {
      'es': '1:30 PM',
      'en': '1:30 PM',
    },
    'yqyimhhz': {
      'es': '2:00 PM',
      'en': '2:00 PM',
    },
    'xino1z0i': {
      'es': '2:30 PM',
      'en': '2:30 PM',
    },
    '8qxtn009': {
      'es': '3:00 PM',
      'en': '3:00 PM',
    },
    '3iudyl33': {
      'es': '3:30 PM',
      'en': '3:30 PM',
    },
    't1wkwwcs': {
      'es': '4:00 PM',
      'en': '4:00 PM',
    },
    'kbw8hgka': {
      'es': '4:30 PM',
      'en': '4:30 PM',
    },
    'x9e312ll': {
      'es': '5:00 PM',
      'en': '5:00 PM',
    },
    'srkr5a3z': {
      'es': '5:30 PM',
      'en': '5:30 PM',
    },
    'de8hnzax': {
      'es': '6:00 PM',
      'en': '6:00 PM',
    },
    '4pv3prqo': {
      'es': '6:30 PM',
      'en': '6:30 PM',
    },
    'drbbtc2g': {
      'es': '7:00 PM',
      'en': '7:00 PM',
    },
    '0d04zw0j': {
      'es': '7:30 PM',
      'en': '7:30 PM',
    },
    'vlup2ei7': {
      'es': '8:00 PM',
      'en': '8:00 PM',
    },
    'a6zjfovj': {
      'es': '8:30 PM',
      'en': '8:30 PM',
    },
    'cfib7kal': {
      'es': 'Confirmar Hora',
      'en': 'Confirm Time',
    },
  },
  // EditarCita
  {
    'kg7cz8eo': {
      'es': 'Detalles de la Cita',
      'en': 'Appointment Details',
    },
    'c5ls4fu7': {
      'es': 'Nombre',
      'en': 'Name',
    },
    'k9ip68vz': {
      'es': 'Teléfono',
      'en': 'Phone',
    },
    'rzbov71s': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'vxstomkf': {
      'es': 'Barbero',
      'en': 'Barber',
    },
    's5ye7tt9': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'ys0xgjg4': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    '4j9xn6y3': {
      'es': 'Option 2',
      'en': 'Option 2',
    },
    'f8fswgdr': {
      'es': 'Option 3',
      'en': 'Option 3',
    },
    'jtjyu35q': {
      'es': 'Fecha y Hora',
      'en': 'Date and Time',
    },
    'i3uky36y': {
      'es': 'Fecha',
      'en': 'Date',
    },
    'slz3xjiu': {
      'es': 'Hora',
      'en': 'Hour',
    },
    'mvhzlb5k': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'am22vv06': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'xhdgj8lu': {
      'es': '9:30 AM',
      'en': '9:30 AM',
    },
    'dann67tq': {
      'es': '10:00 AM',
      'en': '10:00 AM',
    },
    'hxvds484': {
      'es': '10:30 AM',
      'en': '10:30 AM',
    },
    'zpdnurmu': {
      'es': '11:00 AM',
      'en': '11:00 AM',
    },
    'ttqsqtyv': {
      'es': '11:30 AM',
      'en': '11:30 AM',
    },
    '2l7fab9c': {
      'es': '1:00 PM',
      'en': '1:00 PM',
    },
    'w1jnjf80': {
      'es': '1:30 PM',
      'en': '1:30 PM',
    },
    'h3uppw9m': {
      'es': '2:00 PM',
      'en': '2:00 PM',
    },
    '6wgsa5o4': {
      'es': '2:30 PM',
      'en': '2:30 PM',
    },
    'f7fokxxs': {
      'es': '3:00 PM',
      'en': '3:00 PM',
    },
    'qp7xcavm': {
      'es': '3:30 PM',
      'en': '3:30 PM',
    },
    'mjzet0zn': {
      'es': '4:00 PM',
      'en': '4:00 PM',
    },
    'hnkx6xms': {
      'es': '4:30 PM',
      'en': '4:30 PM',
    },
    'n3y3y8bn': {
      'es': '5:00 PM',
      'en': '5:00 PM',
    },
    'j0ypohj1': {
      'es': '5:30 PM',
      'en': '5:30 PM',
    },
    'smpmvwrr': {
      'es': '6:00 PM',
      'en': '6:00 PM',
    },
    '2bh7vecd': {
      'es': '6:30 PM',
      'en': '6:30 PM',
    },
    'ekvhu09i': {
      'es': '7:00 PM',
      'en': '7:00 PM',
    },
    'qsqqhkp6': {
      'es': '7:30 PM',
      'en': '7:30 PM',
    },
    '5t5f3bju': {
      'es': '8:00 PM',
      'en': '8:00 PM',
    },
    'zxitdx2l': {
      'es': '8:30 PM',
      'en': '8:30 PM',
    },
    'b27mkfac': {
      'es': 'Editar Cita',
      'en': 'Edit Quote',
    },
    'dp2pydba': {
      'es': 'Editar Cita',
      'en': 'Edit Quote',
    },
  },
  // RegistrarServicios
  {
    'orzpth64': {
      'es': 'Registrar Servicio',
      'en': 'Register Service',
    },
    'zzdh1bna': {
      'es': 'Detalles del Servicio',
      'en': 'Service Details',
    },
    '0cujes35': {
      'es': 'Datos del Cliente',
      'en': 'Customer Data',
    },
    's1dasyuq': {
      'es': 'Nombre del Cliente',
      'en': 'Client Name',
    },
    'ioovkg6j': {
      'es': 'Email del Cliente',
      'en': 'Customer Email',
    },
    'xodpc8vo': {
      'es': 'Servicios Realizados',
      'en': 'Services Performed',
    },
    '4ev83x9w': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    'b8jfqw16': {
      'es': 'Option 2',
      'en': 'Option 2',
    },
    'tpv0jj3f': {
      'es': 'Option 3',
      'en': 'Option 3',
    },
    'bitgas8f': {
      'es': 'Método de Pago',
      'en': 'Payment Method',
    },
    'vth5b3jp': {
      'es': 'Seleccionar...',
      'en': 'Select...',
    },
    'l5ocya6c': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'otd4qrza': {
      'es': 'Efectivo',
      'en': 'Cash',
    },
    'vxllgvu1': {
      'es': 'SINPE móvil',
      'en': 'SINPE mobile',
    },
    'tyv4p1fq': {
      'es': 'Tarjeta',
      'en': 'Card',
    },
    'yx4hhiks': {
      'es': 'Firma del cliente',
      'en': 'Client\'s signature',
    },
    '9wn3u561': {
      'es': 'Registrar Servicio',
      'en': 'Register Service',
    },
  },
  // ProductosCRUD
  {
    'shmfsp8x': {
      'es': 'Productos',
      'en': 'Products',
    },
    'jltgbm6v': {
      'es': 'Lista de Productos',
      'en': 'Product List',
    },
    'ytntddzq': {
      'es': 'Agregar Producto',
      'en': 'Add Product',
    },
    '2bl6wh0t': {
      'es': 'Todos',
      'en': 'All',
    },
    'srhnz5wn': {
      'es': 'Seleccione la categoría del producto',
      'en': 'Select the product category',
    },
    'px080v76': {
      'es': 'Search...',
      'en': 'Search...',
    },
    '3riivatc': {
      'es': 'Todos',
      'en': 'All',
    },
    'xh81hadm': {
      'es': 'Lacas',
      'en': 'Lacquers',
    },
    'ro0nnk3r': {
      'es': 'Cremas',
      'en': 'Creams',
    },
    'dpgo28n1': {
      'es': 'Polvos',
      'en': 'Powder',
    },
    '7r6hz89o': {
      'es': 'Balzamo',
      'en': 'Balzamo',
    },
    'r2mw0mq4': {
      'es': 'Shampoo',
      'en': 'Shampoo',
    },
    'o48tq489': {
      'es': 'Perfumes',
      'en': 'Perfumes',
    },
    'nezzwi0m': {
      'es': 'Ropa',
      'en': 'Clothes',
    },
    'hb2wtr1u': {
      'es': 'Accesorios',
      'en': 'Accessories',
    },
    'v2375ug4': {
      'es': 'Ceras',
      'en': 'Waxes',
    },
    'vuentwgr': {
      'es': 'Otros',
      'en': 'Others',
    },
    'azpou6fz': {
      'es': 'Producto:',
      'en': 'Product:',
    },
    'a1bwign8': {
      'es': 'Descripción: ',
      'en': 'Description:',
    },
    '73w5kzuv': {
      'es': 'Precio Compra: ',
      'en': 'Purchase Price:',
    },
    'ksbkha3l': {
      'es': 'Precio Venta:',
      'en': 'Sale Price:',
    },
    'k9f6bcyr': {
      'es': 'Categorías:',
      'en': 'Categories:',
    },
    'qrefv298': {
      'es': 'Cantidad:',
      'en': 'Amount:',
    },
    'mwun9p4p': {
      'es': 'Proveedoor:',
      'en': 'Supplier:',
    },
    'ibdypjeh': {
      'es': 'Barba',
      'en': 'Beard',
    },
    'lgk0tz7f': {
      'es': '\$150.00',
      'en': '\$150.00',
    },
    '3okwwpoa': {
      'es': 'Corte y Barba',
      'en': 'Cut and Beard',
    },
    '5z38ymr6': {
      'es': '\$300.00',
      'en': '\$300.00',
    },
    '7bzc6igr': {
      'es': 'Facial Completo',
      'en': 'Full Facial',
    },
    'z8wmvhfn': {
      'es': '\$400.00',
      'en': '\$400.00',
    },
    '2gx92p8m': {
      'es': 'Tinte de Cabello',
      'en': 'Hair Dye',
    },
    '7xgy08yl': {
      'es': '\$500.00',
      'en': '\$500.00',
    },
  },
  // ProductoEditar
  {
    '3s312x4x': {
      'es': 'Información del Producto',
      'en': 'Product Information',
    },
    '6jejfmz7': {
      'es': 'Nombre del Producto',
      'en': 'Product Name',
    },
    'ejbn2dgi': {
      'es': 'Ej: Moco de Gorilla',
      'en': 'Eg: Gorilla snot',
    },
    'a30h4mnw': {
      'es': 'Descripción',
      'en': 'Description',
    },
    '2okysm0j': {
      'es': 'Describe los detalles del Producto...',
      'en': 'Describe the details of the product...',
    },
    'aj7uuqo3': {
      'es': 'Precio COMPRA',
      'en': 'Purchase Price',
    },
    'o9vmbryb': {
      'es': '₡0.00',
      'en': '₡0.00',
    },
    'v8kspco8': {
      'es': 'Precio Venta',
      'en': 'Sale Price',
    },
    '20kolam7': {
      'es': '₡0.00',
      'en': '₡0.00',
    },
    'gkftyadd': {
      'es': 'Proveedor',
      'en': 'Supplier',
    },
    'qsy8flly': {
      'es': 'Proveedor',
      'en': 'Supplier',
    },
    'ncnjli2y': {
      'es': 'STOCK',
      'en': 'STOCK',
    },
    'hof808x4': {
      'es': 'Número de Unidades...',
      'en': 'Number of Units...',
    },
    'd4xi2wgk': {
      'es': 'Categorias',
      'en': 'Categories',
    },
    'qijy4yf4': {
      'es': 'Todos',
      'en': 'All',
    },
    '401nmmxb': {
      'es': 'Ceras',
      'en': 'Waxes',
    },
    '5wakkzh4': {
      'es': 'Lacas',
      'en': 'Lacquers',
    },
    '78975q32': {
      'es': 'Polvos',
      'en': 'Powder',
    },
    'ocdo9wl0': {
      'es': 'Shampoo',
      'en': 'Shampoo',
    },
    'xmosx613': {
      'es': 'Gel',
      'en': 'Gel',
    },
    'u8s0r3tv': {
      'es': 'Cremas',
      'en': 'Creams',
    },
    'hkrrpxj7': {
      'es': 'Editar Producto',
      'en': 'Edit Product',
    },
    'vbqtt3il': {
      'es': 'Editar Producto',
      'en': 'Edit Product',
    },
  },
  // TablaRendimiento
  {
    'ntb3qwe6': {
      'es': 'Empleado',
      'en': 'Employee',
    },
    'y8nkz1hi': {
      'es': 'Servicios',
      'en': 'Services',
    },
    '7ew3x452': {
      'es': 'Monto Generado',
      'en': 'Amount Generated',
    },
    'thvtgufw': {
      'es': 'Monto Total',
      'en': 'Total Amount',
    },
    'yqd5fhn5': {
      'es': 'cantServicios',
      'en': 'cantServices',
    },
    'lrgcft15': {
      'es': 'Montototal',
      'en': 'Total amount',
    },
    '2jjy47y8': {
      'es': 'Rendimiento de Empleados',
      'en': 'Employee Performance',
    },
    'wkp5yfim': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // generarReportes
  {
    'mtavl8w9': {
      'es': 'Seleccione el tipo de reporte',
      'en': 'Select the type of report',
    },
    'i5l9di1d': {
      'es': 'Reporte de Servicios',
      'en': 'Service Report',
    },
    '4tyjhsbq': {
      'es': 'Visualice todos los servicios realizados en un período',
      'en': 'View all services performed in a period',
    },
    'sjurc8j5': {
      'es': 'Reporte de Ventas',
      'en': 'Sales Report',
    },
    '4pyjkaxi': {
      'es':
          'Genere un reporte detallado de todas las ventas realizadas en un periodo',
      'en': 'Generate a detailed report of all sales made in a period',
    },
    'xk8qcydq': {
      'es': 'Generación de Reporte',
      'en': 'Report Generation',
    },
  },
  // seleccionPeriodosServicios
  {
    '5c3ksdcv': {
      'es': 'Reporte de Servicios',
      'en': 'Service Report',
    },
    'p2v8ux9s': {
      'es': 'Selecciona el Período',
      'en': 'Select the Period',
    },
    'j4lv08xo': {
      'es':
          'Elige el intervalo de tiempo para generar el reporte de ventas y análisis',
      'en':
          'Choose the time interval to generate the sales and analysis report',
    },
    '3fwid6gc': {
      'es': 'Generar Reporte',
      'en': 'Generate Report',
    },
    'ezpxtv4t': {
      'es': 'Abrir Reporte',
      'en': 'Open Report',
    },
  },
  // informacionCliente
  {
    '81zu7obz': {
      'es': 'Consulta de Clientes',
      'en': 'Customer Inquiry',
    },
  },
  // consultaServiciosINFORMALES
  {
    'oe5pa89v': {
      'es': 'Servicios Informales',
      'en': 'Informal Services',
    },
    'bzb7fei2': {
      'es': 'Buscar cliente',
      'en': 'Search for a client',
    },
    'g7lrczvc': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // seleccionPeriodosProductos
  {
    'odw7ccp5': {
      'es': 'Reporte de Productos',
      'en': 'Product Report',
    },
    'rkxl6ppd': {
      'es': 'Selecciona el Período',
      'en': 'Select the Period',
    },
    's125ui8u': {
      'es':
          'Elige el intervalo de tiempo para generar el reporte de ventas y análisis',
      'en':
          'Choose the time interval to generate the sales and analysis report',
    },
    'cu5iwwwv': {
      'es': 'Fecha Inicial',
      'en': 'Start Date',
    },
    'ojtad6g4': {
      'es': '15 Enero 2024',
      'en': 'January 15, 2024',
    },
    'hrklvjed': {
      'es': 'Fecha Final',
      'en': 'Final Date',
    },
    'b3ls5uqc': {
      'es': '15 Enero 2024',
      'en': 'January 15, 2024',
    },
    'd2fmsd1z': {
      'es': 'Generar Reporte',
      'en': 'Generate Report',
    },
    'hk6foz8w': {
      'es': 'Abrir Reporte',
      'en': 'Open Report',
    },
  },
  // CitasBabrbero
  {
    'cqilciqp': {
      'es': 'Reservadas',
      'en': 'Reserved',
    },
    'op98yan6': {
      'es': 'Fecha de cita:',
      'en': 'Appointment date:',
    },
    'xm4kcikg': {
      'es': 'Hora Cita:',
      'en': 'Appointment Time:',
    },
    'qfg9ooiq': {
      'es': 'Barbero:',
      'en': 'Barber:',
    },
    '0d8sq11x': {
      'es': 'Cliente:',
      'en': 'Customer:',
    },
    'wd7fxswg': {
      'es': 'Reservada',
      'en': 'Reserved',
    },
    '8jlntpiz': {
      'es': 'Completadas',
      'en': 'Completed',
    },
    'n56cg52p': {
      'es': 'Fecha de cita:',
      'en': 'Appointment date:',
    },
    'fodccqv3': {
      'es': 'Hora Cita:',
      'en': 'Appointment Time:',
    },
    'ii06j7iy': {
      'es': 'Barbero:',
      'en': 'Barber:',
    },
    'ilnopbqf': {
      'es': 'Cliente:',
      'en': 'Customer:',
    },
    '3tjzbgwq': {
      'es': 'Servicio:',
      'en': 'Service:',
    },
    'uq9zbk4y': {
      'es': 'Terminar Cita',
      'en': 'End Appointment',
    },
    '4mfj1odf': {
      'es': 'Completada',
      'en': 'Completed',
    },
    '8jke24v2': {
      'es': 'Citas',
      'en': 'Quotes',
    },
    'rycaa4hk': {
      'es': 'My Trips',
      'en': 'My Trips',
    },
  },
  // HistorialCliente
  {
    'lyd7tf2y': {
      'es': 'Historial de Servicios',
      'en': 'Service History',
    },
    '3wrgghrh': {
      'es': 'Servicios recibidos:',
      'en': 'Services received:',
    },
    'g2z2rws5': {
      'es': 'Barber',
      'en': 'Barber',
    },
    '5i3znuhk': {
      'es': 'Date',
      'en': 'Date',
    },
  },
  // citasBarberos
  {
    'qjxs55nm': {
      'es': 'Citas de cada barbero',
      'en': 'Quotes from each barber',
    },
    'h6nlnblz': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // citasBarberoRegistro
  {
    'n2piuxme': {
      'es': 'Citas Registradas',
      'en': 'Registered Appointments',
    },
    'k0a4eike': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // ReportesServicios
  {
    'k210b2s3': {
      'es': ' Filtros',
      'en': 'Filters',
    },
    'ltqsfstq': {
      'es': 'Desde:                                     Hasta:',
      'en': 'From: To:',
    },
    't7bmrozb': {
      'es': 'Generar Reporte',
      'en': 'Generate Report',
    },
    'j23ia7tp': {
      'es': '12/01/2023',
      'en': '12/01/2023',
    },
    'u98djlrn': {
      'es': 'Service',
      'en': 'Service',
    },
    'kkai1b8h': {
      'es': 'Quantity',
      'en': 'Quantity',
    },
    'lwa7vd7n': {
      'es': 'Total',
      'en': 'Total',
    },
    'jo53gn3x': {
      'es': 'Corte',
      'en': 'Court',
    },
    '6ivh7ntg': {
      'es': '10',
      'en': '10',
    },
    'dml47ie3': {
      'es': '\$250.00',
      'en': '\$250.00',
    },
    't2iize7m': {
      'es': 'Barba',
      'en': 'Beard',
    },
    'sp8itu3w': {
      'es': '5',
      'en': '5',
    },
    'nwan70i4': {
      'es': '\$100.00',
      'en': '\$100.00',
    },
    '63pjn7wo': {
      'es': 'Tinte',
      'en': 'Dye',
    },
    'oo4j56hc': {
      'es': '2',
      'en': '2',
    },
    'teercunb': {
      'es': '\$160.00',
      'en': '\$160.00',
    },
    'x5pvxin8': {
      'es': 'Total General',
      'en': 'Grand Total',
    },
    'hh8o2b4b': {
      'es': '\$510.00',
      'en': '\$510.00',
    },
    'p4b8yro9': {
      'es': 'Barber Earnings (60%)',
      'en': 'Barber Earnings (60%)',
    },
    'm0y4fbf6': {
      'es': '\$306.00',
      'en': '\$306.00',
    },
    '2xeo8c6h': {
      'es': 'Summary - All Barbers',
      'en': 'Summary - All Barbers',
    },
    'dh3ve45h': {
      'es': '12/01/2023',
      'en': '12/01/2023',
    },
    'xidhjhfd': {
      'es': 'Barber',
      'en': 'Barber',
    },
    'wf85o0mr': {
      'es': 'Services',
      'en': 'Services',
    },
    '7ik6828j': {
      'es': 'Total',
      'en': 'Total',
    },
    'a2st484g': {
      'es': 'Pedro Ramírez',
      'en': 'Pedro Ramírez',
    },
    'enu5gb86': {
      'es': '17',
      'en': '17',
    },
    '9hbckyni': {
      'es': '\$510.00',
      'en': '\$510.00',
    },
    '5wkobfbh': {
      'es': 'Maria González',
      'en': 'Maria Gonzalez',
    },
    'al4cqmjb': {
      'es': '15',
      'en': '15',
    },
    '0s8r41q4': {
      'es': '\$580.00',
      'en': '\$580.00',
    },
    'tv0cbw40': {
      'es': 'Juan Pérez',
      'en': 'Juan Pérez',
    },
    'tln27qfi': {
      'es': '20',
      'en': '20',
    },
    'xpm25vpp': {
      'es': '\$520.00',
      'en': '\$520.00',
    },
    '4agqvddf': {
      'es': 'Total Services',
      'en': 'Total Services',
    },
    'e4sv2pk5': {
      'es': '52',
      'en': '52',
    },
    'l8swu5ne': {
      'es': 'Total Revenue',
      'en': 'Total Revenue',
    },
    'whussmca': {
      'es': '\$1,610.00',
      'en': '\$1,610.00',
    },
    'ucgx32dh': {
      'es': 'Shop Earnings (40%)',
      'en': 'Shop Earnings (40%)',
    },
    'xv14ku1y': {
      'es': '\$644.00',
      'en': '\$644.00',
    },
    'p5dvh80w': {
      'es': 'Reporte de Ganancias',
      'en': 'Earnings Report',
    },
  },
  // comentarioUsers
  {
    'eowxkoa0': {
      'es': '¿Cómo podemos mejorar?',
      'en': '',
    },
    'qdnak227': {
      'es':
          'Tus comentarios nos ayudan a mejorar la aplicación. Cuéntanos tu experiencia o sugerencias.',
      'en': '',
    },
    '4ulwmwia': {
      'es': 'Escribe tus comentarios aquí...',
      'en': '',
    },
    'h0p0jl3s': {
      'es': 'Enviar Comentarios',
      'en': '',
    },
    'q1jnkb2h': {
      'es': 'Escribe tus comentarios aquí es requerido',
      'en': '',
    },
    'bqnskj1i': {
      'es': 'Tu mensaje debe ser más largo ',
      'en': '',
    },
    'yw57fxqc': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'yw5gyt9w': {
      'es': 'Opiniones',
      'en': '',
    },
  },
  // comenatriosADM
  {
    '0pgnjlgk': {
      'es': 'Eliminar',
      'en': '',
    },
    '2olo9wqq': {
      'es': 'Comentarios',
      'en': '',
    },
  },
  // bottomSheet
  {
    'xya3711g': {
      'es': 'Scheduled appointment!',
      'en': 'Scheduled appointment!',
    },
    'cqbm71bk': {
      'es': 'You have successfully booked a session on:',
      'en': 'You have successfully booked a session on:',
    },
    'x8jpezmw': {
      'es': 'Mon, Dec 11 - 2021',
      'en': 'Mon, Dec 11 - 2021',
    },
  },
  // total
  {
    'aigtsg4o': {
      'es': 'Order Total',
      'en': 'Order Total',
    },
    'kihcnu9c': {
      'es':
          'Your order total is a summary of all items in your order minus any fees and taxes associated with your purchase.',
      'en':
          'Your order total is a summary of all items in your order minus any fees and taxes associated with your purchase.',
    },
    'n2bpyb7r': {
      'es': 'Okay',
      'en': 'Okay',
    },
  },
  // changePhoto
  {
    'sw151pwd': {
      'es': 'Cambiar foto de perfil',
      'en': 'Change profile picture',
    },
    '86a936fh': {
      'es': 'Cargar foto',
      'en': 'Upload photo',
    },
    'zk44l6id': {
      'es': 'Guardar foto',
      'en': 'Save photo',
    },
  },
  // review
  {
    'iqt03by4': {
      'es': 'Rate Your Experience',
      'en': 'Rate Your Experience',
    },
    'uwqp8w7i': {
      'es': 'Let us know what you thought of the  experience below!',
      'en': 'Let us know what you thought of the experience below!',
    },
    'imn09gjc': {
      'es': 'How would you rate it?',
      'en': 'How would you rate it?',
    },
    'z78y4mja': {
      'es': 'Please leave a descriptio...',
      'en': 'Please leave a description...',
    },
    'wafildut': {
      'es': 'Submit Review',
      'en': 'Submit Review',
    },
  },
  // changeMainPhoto
  {
    '96pirb2s': {
      'es': 'Change Main Photo',
      'en': 'Change Main Photo',
    },
    '6ubhrnl5': {
      'es': 'Upload Photo',
      'en': 'Upload Photo',
    },
    '19qlt23t': {
      'es': 'Save Photo',
      'en': 'Save Photo',
    },
  },
  // cancelAppointment
  {
    'iywdgomb': {
      'es': 'Cancel appointment',
      'en': 'Cancel appointment',
    },
    '5km590al': {
      'es':
          'If you want to cancel your appointment please leave a note below to send to the host.',
      'en':
          'If you want to cancel your appointment please leave a note below to send to the host.',
    },
    'eoea6ya0': {
      'es': 'Your reason for cancelling...',
      'en': 'Your reason for cancelling...',
    },
    'tbx8di1e': {
      'es': 'Yes, Cancel Appo',
      'en': 'Yes, Cancel Appo',
    },
    'zt4v9440': {
      'es': 'Never Mind',
      'en': 'Never Mind',
    },
  },
  // confirmarCita
  {
    'hfmmgofc': {
      'es': 'Confirmar Cita',
      'en': 'Confirm Appointment',
    },
    'x1s9zzqo': {
      'es': 'Detalles de tu cita',
      'en': 'Your appointment details',
    },
    'k2xvqtql': {
      'es': 'Dr. María González',
      'en': 'Dr. María González',
    },
    '9w6iu1jw': {
      'es': 'Medicina General',
      'en': 'General Medicine',
    },
    'wzt15jmx': {
      'es': 'Fecha',
      'en': 'Date',
    },
    'o43ix687': {
      'es': '15 de Marzo, 2024',
      'en': 'March 15, 2024',
    },
    '0b5ua8fi': {
      'es': 'Hora',
      'en': 'Hour',
    },
    'x0l2fvpe': {
      'es': '10:30 AM',
      'en': '10:30 AM',
    },
    'plseffa1': {
      'es': 'Confirmar Cita',
      'en': 'Confirm Appointment',
    },
    'shjmy4tn': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
  },
  // seleccionarHora
  {
    'r0e69i70': {
      'es': 'Seleccionar hora',
      'en': 'Select time',
    },
    'wn2pbyaf': {
      'es': 'Available Times',
      'en': 'Available Times',
    },
    'tphlwae0': {
      'es': '9:00 AM',
      'en': '9:00 AM',
    },
    '7bm3l10p': {
      'es': '10:00 AM',
      'en': '10:00 AM',
    },
    'ib2xez13': {
      'es': '11:00 AM',
      'en': '11:00 AM',
    },
    'pt3ehl9v': {
      'es': '1:00 PM',
      'en': '1:00 PM',
    },
    'msy7nbua': {
      'es': '2:00 PM',
      'en': '2:00 PM',
    },
    'zm9kmyul': {
      'es': '3:00 PM',
      'en': '3:00 PM',
    },
    'pzbbk8x4': {
      'es': 'Confirmar',
      'en': 'Confirm',
    },
  },
  // CrearAgenda
  {
    'g82dm5dd': {
      'es': 'Crear Agenda',
      'en': 'Create Agenda',
    },
    'wnmfouuz': {
      'es': '📅 Escoger Fecha',
      'en': '📅 Choose Date',
    },
    'n3tzp1mh': {
      'es': 'Hora Inicio',
      'en': 'Start Time',
    },
    'u1eb31ta': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'na9c47cl': {
      'es': 'Search...',
      'en': 'Search...',
    },
    '1dfgt0hb': {
      'es': '09:00',
      'en': '09:00',
    },
    '564c4par': {
      'es': '10:00',
      'en': '10:00',
    },
    'x6ij5uqb': {
      'es': '11:00',
      'en': '11:00',
    },
    'wvfdlopa': {
      'es': '12:00',
      'en': '12:00',
    },
    'ytklh9g4': {
      'es': '13:00',
      'en': '1:00 PM',
    },
    'cmo4n6el': {
      'es': '14:00',
      'en': '2:00 PM',
    },
    'jsukzord': {
      'es': '15:00',
      'en': '3:00 PM',
    },
    'deqswy9e': {
      'es': '16:00',
      'en': '4:00 PM',
    },
    'ktffr9w8': {
      'es': '17:00',
      'en': '17:00',
    },
    'qa3klf9w': {
      'es': '18:00',
      'en': '18:00',
    },
    '5vflubyi': {
      'es': 'Hora Final',
      'en': 'Final Hour',
    },
    'xe3cvap3': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'hg9aio7n': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'pq16eh6q': {
      'es': '09:00',
      'en': '09:00',
    },
    'jwtdpr8z': {
      'es': '10:00',
      'en': '10:00',
    },
    'oc9ncwb0': {
      'es': '11:00',
      'en': '11:00',
    },
    'i1gd8ukl': {
      'es': '12:00',
      'en': '12:00',
    },
    'kken9000': {
      'es': '13:00',
      'en': '1:00 PM',
    },
    'e2th0obd': {
      'es': '14:00',
      'en': '2:00 PM',
    },
    '3dderc1t': {
      'es': '15:00',
      'en': '3:00 PM',
    },
    'was2ncks': {
      'es': '16:00',
      'en': '4:00 PM',
    },
    'zul4uz4a': {
      'es': '17:00',
      'en': '17:00',
    },
    '26nxzf6y': {
      'es': '18:00',
      'en': '18:00',
    },
    'h063adr7': {
      'es': 'CREAR AGENDA',
      'en': 'CREATE AGENDA',
    },
  },
  // ratingServiceComponent
  {
    'rsytkxjh': {
      'es': 'Califica tu experiencia',
      'en': 'Rate your experience',
    },
    'hqekzhc8': {
      'es': 'Selecciona el barbero que te atendió',
      'en': 'Select the barber who served you',
    },
    'qeau46cc': {
      'es': 'Seleccione el barbero',
      'en': 'Select the barber',
    },
    '4pi8i3xl': {
      'es': 'Search...',
      'en': 'Search...',
    },
    '9umsf1tm': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    '4rmmzt00': {
      'es': 'Option 2',
      'en': 'Option 2',
    },
    'pnkok8ki': {
      'es': 'Option 3',
      'en': 'Option 3',
    },
    'jkyvgnea': {
      'es': 'Cuentanos acerca de tu opinion',
      'en': 'Tell us about your opinion',
    },
    '6gpqxngg': {
      'es': 'Subir calificación',
      'en': 'Increase rating',
    },
  },
  // Miscellaneous
  {
    'lk67kf5x': {
      'es': '',
      'en': '',
    },
    'm6negbzj': {
      'es': '',
      'en': '',
    },
    'ozgrw90a': {
      'es': '',
      'en': '',
    },
    '35i8xas1': {
      'es': '',
      'en': '',
    },
    '603mugtm': {
      'es': '',
      'en': '',
    },
    'yzdn6fji': {
      'es': '',
      'en': '',
    },
    '1odprrs7': {
      'es': '',
      'en': '',
    },
    'rtr11a3x': {
      'es': '',
      'en': '',
    },
    'rpmgmbcm': {
      'es': '',
      'en': '',
    },
    'yithw862': {
      'es': '',
      'en': '',
    },
    'w04ndo90': {
      'es': '',
      'en': '',
    },
    'gv4f995p': {
      'es': '',
      'en': '',
    },
    'tj41z0v0': {
      'es': '',
      'en': '',
    },
    '9c57nhsc': {
      'es': '',
      'en': '',
    },
    'qskjovhr': {
      'es': '',
      'en': '',
    },
    'jcubsftp': {
      'es': '',
      'en': '',
    },
    '1l7u6egz': {
      'es': '',
      'en': '',
    },
    'fzj4rhe3': {
      'es': '',
      'en': '',
    },
    'jct2ifdf': {
      'es': '',
      'en': '',
    },
    'd1awt42w': {
      'es': '',
      'en': '',
    },
    'evb0i80h': {
      'es': '',
      'en': '',
    },
    '2g3j6ai6': {
      'es': '',
      'en': '',
    },
    'luhpdolp': {
      'es': '',
      'en': '',
    },
    'rf7s90jx': {
      'es': '',
      'en': '',
    },
    'arbxw3v8': {
      'es': '',
      'en': '',
    },
    'qifl6if1': {
      'es': '',
      'en': '',
    },
    'v6opv6k0': {
      'es': '',
      'en': '',
    },
    'dh3s1xsr': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
