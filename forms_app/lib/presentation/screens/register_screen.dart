import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';

import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New User'),
      ),
      
      
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
      
      
    );

  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();
  
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100,),
              _RegisterForm(),
              SizedBox(height: 20,),
            
             ],
          ),
        ),
      ),
    );
  }
}


class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); En este caso del BlocProvider no es necesario
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final Username username = registerCubit.state.username;
    final Password password = registerCubit.state.password;
    final Email email = registerCubit.state.email;
    return Form(
      //key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Name',
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage,
            //errorMessage: username.isPure || username.isValid 
            //  ? null 
            //  : 'Usuario no Valido',
          ),  
          SizedBox(height: 20,),
          CustomTextFormField(
            label: 'Email',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,

            //onChanged: (value) {
            //  registerCubit.emailChanged(value);
              //_formKey.currentState?.validate();
            //},
            //validator: (value) {
            //  if (value == null || value.isEmpty) return 'Required field';
            //  if (value.trim().isEmpty) return 'Required field';
            //  if (value.length < 6) return 'Min 6 characters';
              //if (!value.contains('@')) return 'Invalid email';
              //validar la expresion regular
           //   if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").
           //   hasMatch(value)) return 'Invalid email Regex';
           //   return null;  

            //}
          ),
          SizedBox(height: 20,),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
            
          ),

          /* TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ), */
          const SizedBox(height: 20,),
          FilledButton.tonalIcon(
            onPressed: () {
              //final isValidForm = _formKey.currentState!.validate();
              //if (!isValidForm) return;
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

//  A CONTINUACIÓN ESTA EL CODIGO ORIGINAL DE LA PANTALLA DE REGISTRO FORMULARIO TRADICIONAL

/* 
import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New User'),
      ),
      body: const _RegisterView(),
    );

  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();
  
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100,),
              _RegisterForm(),
              SizedBox(height: 20,),
            
             ],
          ),
        ),
      ),
    );
  }
}


class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});
  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username='';
  String email='';
  String password='';


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            onChanged: (value) => username = value,
            label: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) return 'Required field';
              if (value.trim().isEmpty) return 'Required field';
              if (value.length < 6) return 'Min 6 characters';
              return null;
            }
          ),  
          SizedBox(height: 20,),
          CustomTextFormField(
            onChanged: (value) => email = value,
            label: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) return 'Required field';
              if (value.trim().isEmpty) return 'Required field';
              if (value.length < 6) return 'Min 6 characters';
              //if (!value.contains('@')) return 'Invalid email';
              //validar la expresion regular
              if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").
              hasMatch(value)) return 'Invalid email Regex';
              return null;  

            }
          ),
          SizedBox(height: 20,),
          CustomTextFormField(
            onChanged: (value) => password = value,
            label: 'Password',
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Required field';
              if (value.trim().isEmpty) return 'Required field';
              if (value.length < 6) return 'Min 6 characters';
              return null;
            }
          ),

          /* TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ), */
          const SizedBox(height: 20,),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValidForm = _formKey.currentState!.validate();
              if (!isValidForm) return;

              print('username: $username');
              print('email: $email');
              print('password: $password');
            },
            icon: const Icon(Icons.save),
            label: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

 */