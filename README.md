ProjetVHDL

Voici notre README qui résume tous les composants dans ce projet.

    CMDBuffers.vhd : Les buffers, ce sont un type de mémoire qui stocke les données avant de les envoyer à leur destinataire actuelle. Les buffers isolent deux parties en circuits pour but de protéger l'intégralité des données : la modification sur l'une partie ne modifie pas l'autre. Ici, ce sont les buffers pour les commandes qui sortent de l'INSTRMemory ci-dessous. Ils s'agissent la mémoire MEM_SEL_FCT et MEM_SEL_OUT sur le schéma du circuit logique.

    INSTRMemory.vhd : L'abbréviation de INSTRuction Memory, la mémoire des instructions qui contient les opérations élémentaires de chaque fonction. Elle s'agit le bloc de MEM_INSTRUCTIONS sur le schéma du circuit logique. Chaque opération est composée des sous-instructions de commande, de mémoire, et de sortie, toutes sont codées sur 10 bits. Pour réaliser une fonction, le microcontrôleur doit posséder un automate qui se déroule sur une certaine zone de cette mémoire pour récupérer successivement les opérations.

    UALCore.vhd : L'UAL (Unit of Arithmetic Logic ou Unité Arithmétique Logique) est le coeur de notre microcontrôleur, où toutes les opérations arithmétiques sont effectuées.

    UALBuffers.vhd : La partie de mémorisation de l'UAL. Elle s'agit du Buffer_A, Buffer_B, MEM_SR_IN_L, MEM_SR_IN_R, MEM_CACHE_1 et 2 sur le schéma. Ce composant a plusieurs fonctions : l'isolement des données d'entrées de l'UAL, le stockage des retenues, des données d'entrées ou des résultats intermédiares de l'UAL.
    
    UALSelOut.vhd : Ce composant contrôle le routage des données en sortie.

    UALSelRoute.vhd : Ce composant contrôle le routage et les interconnexions dans le circuit logique. Il détermine quelles données à stocker, et quelle zone de mémoire qui va stocker ces données.

    TopLevel.vhd : C'est le fichier au plus haut niveau, qui décrit l'ensemble des fonctionnements du circuit logique à synthétiser. Il contient l'automate qui va effectuer les trois fonctions souhaitées.

Nous avons également fait des simulations ou testbench pour simuler le fonctionnement du circuit logique:

    TestBench.vhd : C'est le testbench de l'UALCore.

    TopLevel_Testbench_.vhd : C'est le testbench de TopLevel

Projet réalisé par Alexandre MOURGUES et Quang Viet NGUYEN en 2021-2022