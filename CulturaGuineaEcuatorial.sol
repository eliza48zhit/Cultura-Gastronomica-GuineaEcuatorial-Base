// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaGuineaEcuatorial
 * @dev Registro de quimica de espesantes naturales y reologia de tuberculos.
 * Serie: Sabores de Africa (43/54)
 */
contract CulturaGuineaEcuatorial {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 puntoFusionOdika;    // Eficiencia de la transicion solido-salsa (1-100)
        uint256 densidadAlmidon;     // Nivel de viscosidad de la malanga/yuca (1-10)
        bool usaPescadoSeco;         // Metodo de conservacion de la proteina
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Pollo con Odika (Ingenieria del Espesante)
        registrarPlato(
            "Pollo con Odika", 
            "Pollo, semillas de mango silvestre (Odika), cebolla, chile.",
            "Rallado del bloque solido de Odika sobre la coccion del pollo; transicion de fase inducida por calor para crear una salsa espesa.",
            95, 
            4, 
            false
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _fusion, 
        uint256 _almidon,
        bool _pescado
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        require(_fusion <= 100, "Escala de fusion excedida");

        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            puntoFusionOdika: _fusion,
            densidadAlmidon: _almidon,
            usaPescadoSeco: _pescado,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
