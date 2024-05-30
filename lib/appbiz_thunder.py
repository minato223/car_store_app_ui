import os
import re

def generate_structure():
    directories = [
        "core/config",
        "core/errors",
        "core/exceptions",
        "core/helpers",
        "core/services",
        "data/repositories",
        "domain/entities",
        "domain/repositories",
        "domain/usecases",
        "env",
        "presentation/controllers",
        "presentation/routes",
        "presentation/screens",
        "presentation/utils",
        "presentation/widgets",
        "presentation/widgets/completes",
        "presentation/widgets/elements"
    ]

    for directory in directories:
        os.makedirs(directory, exist_ok=True)

    print("Structure générée !")

def find_repository_file(class_name):
    repository_files = [file for file in os.listdir(
        "domain/repositories") if file.endswith(".dart")]

    for file in repository_files:
        file_path = os.path.join("domain/repositories", file)
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()
            pattern = f"abstract class {class_name}"
            if re.search(pattern, content):
                return file_path

    return None


def find_impl_file(class_name):
    repository_files = [file for file in os.listdir(
        "data/repositories") if file.endswith(".dart")]

    for file in repository_files:
        file_path = os.path.join("data/repositories", file)
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()
            pattern = f"{class_name}Impl"
            if re.search(pattern, content):
                return file_path

    return None


def camel_to_snake(name):
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower()


def snake_to_lower_camel(name):
    parts = name.split('_')
    return parts[0].lower() + ''.join(x.title() for x in parts[1:])


def generate_use_case():
    use_case_name = input("Nom de l'use case (format: get user email) : ")
    class_name = "".join([word.capitalize() for word in use_case_name.split()])
    filename = camel_to_snake(use_case_name) + ".dart"
    use_case_path = os.path.join("domain/usecases", filename)
    repository_name = input("Nom de la classe abstraite du repository : ")

    with open(use_case_path, "w", encoding="utf-8") as f:
        f.write(
            f"""import '../../data/repositories/{camel_to_snake(repository_name)}_impl.dart';\n\n""")
        f.write(f"""class {class_name} {{\n""")
        f.write(
            f"""  {repository_name}Impl {snake_to_lower_camel(repository_name)}Repository = {repository_name}Impl();\n\n""")
        f.write(f"""  Future execute() async {{\n""")
        f.write(f"""    // Utilisez l'instance du repository ici\n""")
        f.write(f"""  }}\n""")
        f.write(f"""}}\n""")

    method_name = camel_to_snake(use_case_name).replace(" ", "_").lower()
    repository_file_path = find_repository_file(repository_name)

    if repository_file_path:
        with open(repository_file_path, "a", encoding="utf-8") as f:
            f.write(f"\n Future<void> {method_name}() async {{}}\n")
        impl_file_path = find_impl_file(repository_name)

        if impl_file_path:
            with open(impl_file_path, "a", encoding="utf-8") as f:
                f.write(
                    f"\n @override Future<void> {method_name}() async {{\n}}\n")
        else:
            print(
                f"Fichier d'implémentation du repository introuvable pour {repository_name}")
    else:
        print(
            f"Fichier de la classe abstraite du repository introuvable pour {repository_name}")

    print("Use case généré !")


def create_repository():
    repository_name = input("Nom de la classe abstraite du repository : ")
    filename = camel_to_snake(repository_name) + "_repository.dart"
    repository_path = os.path.join("domain/repositories", filename)
    with open(repository_path, "w", encoding="utf-8") as f:
        f.write(f""" abstract class {repository_name}Repository {{ \n""")
        f.write(
            f"""   Future<void> {camel_to_snake(repository_name)}_method(); \n""")
        f.write(f""" }}\n""")
    impl_filename = camel_to_snake(repository_name) + "_repository_impl.dart"
    impl_path = os.path.join("data/repositories", impl_filename)
    with open(impl_path, "w", encoding="utf-8") as f_impl:
        repo_import = f"import '../../domain/repositories/{camel_to_snake(repository_name)}_repository.dart';"
        f_impl.write(f"{repo_import}\n\n")
        f_impl.write(
            f""" class {repository_name}RepositoryImpl implements {repository_name}Repository {{ \n""")

        f_impl.write(
            f"""   @override Future<void> {camel_to_snake(repository_name)}_method() async {{\n""")
        f_impl.write(
            f"""     // Utilisez l'instance de SupabaseDataSource ici\n""")
        f_impl.write(f"""   }} \n""")
        f_impl.write(f""" }}\n""")

    print("Repository créé !")


def create_controller():
    controller_name = input("Nom du contrôleur : ")
    filename = camel_to_snake(controller_name) + "_controller.dart"
    controller_path = os.path.join("presentation/controllers", filename)
    with open(controller_path, "w", encoding="utf-8") as f:
        f.write(f""" import 'package:get/get.dart';\n\n""")
        f.write(
            f""" class {controller_name}Controller extends GetxController {{\n""")
        f.write(f"""   @override\n""")
        f.write(f"""   void onInit() {{\n""")
        f.write(f"""     super.onInit();\n""")
        f.write(f"""     // Code à exécuter lors de l'initialisation du contrôleur\n""")
        f.write(f"""   }}\n""")
        f.write(f""" }}\n""")

    print("Contrôleur créé !")


def main():
    while True:
        print('''
  ░█████╗░██████╗░██████╗░██████╗░██╗███████╗  ████████╗██╗░░██╗██╗░░░██╗███╗░░██╗██████╗░███████╗██████╗░
  ██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║╚════██║  ╚══██╔══╝██║░░██║██║░░░██║████╗░██║██╔══██╗██╔════╝██╔══██╗
  ███████║██████╔╝██████╔╝██████╦╝██║░░███╔═╝  ░░░██║░░░███████║██║░░░██║██╔██╗██║██║░░██║█████╗░░██████╔╝
  ██╔══██║██╔═══╝░██╔═══╝░██╔══██╗██║██╔══╝░░  ░░░██║░░░██╔══██║██║░░░██║██║╚████║██║░░██║██╔══╝░░██╔══██╗
  ██║░░██║██║░░░░░██║░░░░░██████╦╝██║███████╗  ░░░██║░░░██║░░██║╚██████╔╝██║░╚███║██████╔╝███████╗██║░░██║
  ╚═╝░░╚═╝╚═╝░░░░░╚═╝░░░░░╚═════╝░╚═╝╚══════╝  ░░░╚═╝░░░╚═╝░░╚═╝░╚═════╝░╚═╝░░╚══╝╚═════╝░╚══════╝╚═╝░░╚═╝
                ''')
        print("1. 🚀 Créer un Use Case")
        print("2. 📦 Créer un Repository")
        print("3. 🎮 Créer un Contrôleur")
        print("4. 📂 Générer la structure")
        print("5. 🚪 Quitter")
        choice = input("Choisissez une option (1/2/3/4/5) : ")

        if choice == "1":
            generate_use_case()
        elif choice == "2":
            create_repository()
        elif choice == "3":
            create_controller()
        elif choice == "4":
            generate_structure()
        elif choice == "5":
            print("Programme terminé")
            break
        else:
            print("Option invalide. Veuillez choisir une option valide.")


if __name__ == "__main__":
    main()