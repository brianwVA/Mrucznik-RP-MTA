//true random number generator
//max range - 65536

#define RANDOM_NUMBERS_BUFFER 200 //max 1024 - bugged response when more than ~500

new random_numbers[RANDOM_NUMBERS_BUFFER];
new random_numbers_index = 0;
new bool:generate_true_random = false;

forward RefreshNumbersHTTPResponse(index, response_code, data[]);

public OnGameModeInit()
{
    #if defined TrueRandom_OnGameModeInit
        TrueRandom_OnGameModeInit();
    #endif
	RefreshRandomNumbers();
    return 1;
}
#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif
#define OnGameModeInit TrueRandom_OnGameModeInit
#if defined TrueRandom_OnGameModeInit
    forward TrueRandom_OnGameModeInit();
#endif

static RefreshRandomNumbers()
{
	generate_true_random = false;
	HTTP(0, HTTP_GET, "qrng.anu.edu.au/API/jsonI.php?length="#RANDOM_NUMBERS_BUFFER"&type=uint16", "", "RefreshNumbersHTTPResponse");
}

public RefreshNumbersHTTPResponse(index, response_code, data[])
{
    if(response_code == 200)
    {
        printf("Generating new true random numbers.");
		// We process RANDOM_NUMBERS_BUFFER comma separated numbers in the range 0-65535
		new idx, numbersCount, beginGettingNumbers, buffer[6];
		while(data[idx] != '\0' && data[idx] != ']')
		{
			if(beginGettingNumbers)
			{
				new comma = strfind(data, ",", true, idx);
				if(comma == -1)
				{
					break;
				}
				
				strmid(buffer, data, idx, comma);
				new value = strval(buffer);
				random_numbers[numbersCount++] = value;
				if(numbersCount == RANDOM_NUMBERS_BUFFER) 
				{
					break;
				}
				idx += comma-idx+1;
			}
			else
			{
				if(data[idx] == '[')
				{
					beginGettingNumbers = true;
				}
				idx++;
			}
		}
		
        printf("True random numbers refreshed successfully.");
		generate_true_random = true;
		random_numbers_index = 0;
		
    }
    else
    {
        printf("ERROR! The true random number generator request failed! The response code was: %d", response_code);
        printf("Switching to complex random number generator");
		generate_true_random = false;
    }
}

//max range - 65536
true_random(range = 0)
{
	if(generate_true_random)
	{
		if(random_numbers_index >= RANDOM_NUMBERS_BUFFER) {
			RefreshRandomNumbers();
		} else {
			if(range <= 0)
				return random_numbers[random_numbers_index++];
			else
				return random_numbers[random_numbers_index++] % range;
		}
	}
	
	//normal random
	return random(range) % 65536;
}