import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pharmalink/features/signin/logic/cubit/signin_cubit.dart";
import "../../../../core/helpers/classes/field.dart";

Map<String, Field> signInFields = {
  "email": Field(
    "Email",
    inputType: TextInputType.emailAddress,
    dbName: "email",
  ),
  "password": Field(
    "Password",
    inputType: TextInputType.visiblePassword,
    dbName: "password",
  ),
};
