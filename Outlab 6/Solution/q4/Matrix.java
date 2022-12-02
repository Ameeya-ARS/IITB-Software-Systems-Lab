
public class Matrix {

    private float matrix[][] ;
    private int row , col ;

    // Constructor
    // --> Type 1

    public Matrix( int n , double v ) {
        this.matrix = new float[n][n] ;
        this.row = n ;
        this.col = n ;

        for( int i = 0 ; i < n ; i++ )
        {
            for ( int j = 0 ; j < n ; j++ )
            {
                this.matrix[i][j] = (float) v ;
            }
        }
    }

    // --> Type 2
    public Matrix( int n , int m , double v ) {
        this.matrix = new float[n][m] ;
        this.row = n ;
        this.col = m ;

        for ( int i = 0 ; i < n ; i++ )
        {
            for ( int j = 0 ; j < m ; j++ )
            {
                this.matrix[i][j] = (float) v ;
            }
        }
    }

    // --> Type 3
    public Matrix( int n , int m ) {
        this.matrix = new float[n][m] ;
        this.row = n ;
        this.col = m ;

        for( int i = 0 ; i < n ; i++ )
        {
            for ( int j = 0 ; j < m ; j++ )
            {
                this.matrix[i][j] = (float) 0.0 ;
            }
        }
    }

    // --> Type 4
    public Matrix( int n ) {
        this.matrix = new float[n][n] ;

        for( int i = 0 ; i < n ; i++ )
        {
            for( int j = 0 ; j < n ; j++ )
            {
                this.matrix[i][j] = (float) 0.0 ;
            }
        }
    }

    // ADD method
    public Matrix add( Matrix Y ) {

        if( this.row == Y.row && this.col == Y.col ) {
            Matrix Ans = new Matrix(this.row,this.col) ;

            for ( int i = 0 ; i < this.row ; i++ )
            {
                for( int j = 0 ;  j < this.col ; j++ )
                {
                    Ans.matrix[i][j] += (this.matrix[i][j] + Y.matrix[i][j]) ;
                }
            }

            return Ans ;
        }
        else
        {
            System.out.println("Matrix cannot be added");

            Matrix temp = new Matrix(1,1,0.0f) ;
            return temp ; // return 1x1 matrix
        }
    }

    // matmul method
    public Matrix matmul( Matrix Y ) {

        if( this.col == Y.row ) {

            Matrix Ans  = new Matrix(this.row,Y.col,0) ;

            for ( int i = 0 ; i < this.row ; i++ )
            {
                for ( int j = 0 ; j < this.col ; j++ )
                {
                    int sum = 0 ;

                    for ( int k = 0 ; k < this.col ; k++ )
                    {
                        sum += this.matrix[i][k] * Y.matrix[k][j] ;
                    }

                    Ans.matrix[i][j] += sum ;
                }
            }

            return Ans ;
        }
        else {
            System.out.println("Matrices cannot be multiplied");

            Matrix temp = new Matrix(1,1,0) ;
            return temp ;
        }
    }

    // scalarmul method
    public void scalarmul( int x ) {

        for( int i = 0 ; i < this.row ; i++ )
        {
            for ( int j = 0 ; j < this.col ; j++ )
            {
                this.matrix[i][j] *= x ;
            }
        }
    }

    // getrows method
    public int getrows() {
        return this.row ;
    }

    // getcols method
    public int getcols() {
        return this.col ;
    }

    // getelem method
    public float getelem( int r , int c ) {

        if ( r < this.row && c < this.col && r >= 0 && c >= 0 ) {
            return this.matrix[r][c] ;
        }
        else {
            System.out.println("Index out of bound");
            return (-100) ;
        }
    }

    // setelem method
    public void setelem( int r , int c , float v ) {

        if( r < this.row && c < this.col && r >= 0 && c >= 0 ) {
            this.matrix[r][c] = v ;
        }
        else {
            System.out.println("Index out of range");
        }
    }

    // print method
    public void print() {

        for( int i = 0 ; i < this.row ; i++ )
        {
            for ( int j = 0 ; j < this.col ; j++ )
            {
                System.out.print(this.matrix[i][j]+" ");
            }
            System.out.print("\n");
        }
    }
}
