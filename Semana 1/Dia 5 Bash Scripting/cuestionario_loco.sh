#!/bin/bash

echo "🎉 ¡Bienvenido al Cuestionario Loco! 🎉"

# Preguntar nombre
read -p "👤 ¿Cómo te llamás? " nombre

# Preguntar edad
read -p "📅 ¿Cuántos años tenés? " edad

# Preguntar color favorito
read -p "🎨 ¿Cuál es tu color favorito? " color

echo "----------------------------------------"
echo "💥 ¡Hola, $nombre! Tenés $edad años y te gusta el color $color."

# Mensaje personalizado según edad
if [ "$edad" -lt 18 ]; then
  echo "🧒 Sos joven y lleno de energía. ¡A conquistar el mundo!"
elif [ "$edad" -lt 40 ]; then
  echo "💪 Estás en la flor de la vida. ¡A romperla!"
else
  echo "🧓 Experiencia es poder. ¡Sos leyenda!"
fi

# Mensaje especial según color favorito
if [[ "$color" == "rojo" || "$color" == "Rojo" ]]; then
  echo "🔥 El rojo es pasión pura. ¡Explosivo!"
elif [[ "$color" == "azul" || "$color" == "Azul" ]]; then
  echo "🌊 Azul como el mar... ¡tranquilo pero profundo!"
elif [[ "$color" == "verde" || "$color" == "Verde" ]]; then
  echo "🌱 Verde esperanza. ¡Muy buena elección!"
else
  echo "🎨 $color es un color único... como vos 😎"
fi

echo "----------------------------------------"
echo "🚀 Gracias por jugar, $nombre. ¡Sos genial!"

