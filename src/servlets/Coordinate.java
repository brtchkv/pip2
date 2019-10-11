package servlets;

import org.decimal4j.util.DoubleRounder;

public class Coordinate {
    private double x;
    private double y;
    private double r;
    private String requestTime;
    private long executionTime;
    private boolean correct;

    public Coordinate(double x, double y, double r, String requestTime, long executionTime, boolean correct) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.requestTime = requestTime;
        this.executionTime = executionTime;
        this.correct = correct;
    }

    public String editOutput(Double n){
        if (Math.abs(n) >= 1000000000000000.0){ return String.valueOf(n).substring( 0, 3) + "…";}
        else if (Math.abs(n) >= 1000000000000.0){ return DoubleRounder.round((n / 1000000000000.0),1) + "k^4";}
        else if (Math.abs(n) >= 1000000000) {return DoubleRounder.round((n / 1000000000),1) + "kkk";}
        else if (Math.abs(n) >= 1000000) { return DoubleRounder.round((n / 1000000),1) + "kk";}
        else if (Math.abs(n) >= 1000){ return DoubleRounder.round((n / 1000),1) + "k";}
        else { return DoubleRounder.round(n, 1) + "";}
    }

    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getR() {
        return r;
    }

    public void setR(double r) {
        this.r = r;
    }

    public String getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(String requestTime) {
        this.requestTime = requestTime;
    }

    public double getExecutionTime() {
        return executionTime;
    }

    public void setExecutionTime(long executionTime) {
        this.executionTime = executionTime;
    }

    public boolean getCorrect() {
        return correct;
    }

    public void setCorrect(boolean correct) {
        this.correct = correct;
    }

    public String getCorrectWords() {
        if (correct){
            return "Попал";
        }
        return "Мимо";
    }

    public String getColor() {
        if (correct){
            return "#008000";
        }
        return "#B22222";
    }
}