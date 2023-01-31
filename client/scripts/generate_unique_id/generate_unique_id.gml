function generate_unique_id() {
    static counter = 0;
    counter++;
    return counter;
}
