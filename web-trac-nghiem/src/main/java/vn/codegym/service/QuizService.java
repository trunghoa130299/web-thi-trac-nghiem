package vn.codegym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import vn.codegym.model.CauHoi;
import vn.codegym.model.PhuongAn;
import vn.codegym.model.QuestionForm;
import vn.codegym.repository.CauHoiRepository;
import vn.codegym.repository.PhuongAnRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class QuizService {

    @Autowired
    CauHoi cauHoi;
    @Autowired
    QuestionForm qForm;
    @Autowired
    CauHoiRepository qRepo;
    @Autowired
    PhuongAn phuongAn;
    @Autowired
    PhuongAnRepository rRepo;

    public QuestionForm getQuestions() {
        List<CauHoi> allQues = qRepo.findAll();
        List<CauHoi> qList = new ArrayList<CauHoi>();

        Random random = new Random();

        for(int i=0; i<5; i++) {
            int rand = random.nextInt(allQues.size());
            qList.add(allQues.get(rand));
            allQues.remove(rand);
        }

        qForm.setCauHois(qList);

        return qForm;
    }

    public int getResult(QuestionForm qForm) {
        int correct = 0;

        for(CauHoi q: qForm.getCauHois())
            if(q.getAns() == q.getChose())
                correct++;

        return correct;
    }

    public void saveScore(PhuongAn phuongAn) {
        PhuongAn saveResult = new PhuongAn();
        saveResult.setUsername(phuongAn.getUsername());
        saveResult.setTotalCorrect(phuongAn.getTotalCorrect());
        rRepo.save(saveResult);
    }

    public List<PhuongAn> getTopScore() {
        List<PhuongAn> sList = rRepo.findAll(Sort.by(Sort.Direction.DESC, "totalCorrect"));

        return sList;
    }
}
