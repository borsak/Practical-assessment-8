package TestSuite;
import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    public Karate runPet(){
        return Karate.run ("Pet/pet").relativeTo((getClass()));
    }

    @Karate.Test
    public Karate runStore() {
        return Karate.run ("Store/store").relativeTo((getClass()));
    }

    @Karate.Test
    public Karate runUser() {
        return Karate.run ("User/user").relativeTo((getClass()));
    }
}

