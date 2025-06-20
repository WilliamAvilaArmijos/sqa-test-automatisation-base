package com.pichincha;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class TestRunner {

    @Test
    void testParallel() {
        //Para realizar las validaciones de cada una de las feature cambiar en el campo tag el
        // identificador de cada uno de las feature en el ejemplo se esta realizando el
        //de obtener todos los heroes 
        Results results = Runner.path("classpath:com/pichincha/features/marvel_api")
                .tags("@character_retrieval")
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
