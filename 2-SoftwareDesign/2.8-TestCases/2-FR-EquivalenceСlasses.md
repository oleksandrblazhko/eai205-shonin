|Опис вхідних умов|Правильний/неправильний <br> клас еквівалентності|Опис значень вхідних даних|
|:-|:-:|:-|
|1) рядок text  має довжину до 5000 символів; <br> 2) рядок phone має формат "+380"; <br> 3) рядок phone має довжину менше 40 символів|Правильний|text = "текст повідомлення" <br> phone = "+380753168489"|
|1) рядок text  має довжину більше 5000 символів; <br> 2) рядок phone має формат "+380"; <br> 3) рядок phone має довжину менше 40 символів|Неправильний|text = "текст повідомлення...(більше 5000 символів)" <br> phone = "+380753168489"|
|1) рядок text  має довжину до 5000 символів; <br> 2) рядок phone не має формат "+380"; <br> 3) рядок phone має довжину менше 40 символів|Неправильний|text = "текст повідомлення" <br> phone = "+3807531йцукен"|
|1) рядок text  має довжину до 5000 символів; <br> 2)рядок phone має формат "+380"; <br> 3) рядок phone має довжину більше 40 символів|Неправильний|text = "текст повідомлення" <br> phone = "+380753168489...(більше 40 символів)"|
